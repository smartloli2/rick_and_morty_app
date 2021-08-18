import 'package:dartz/dartz.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/core/unique_id.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';
import 'package:rick_and_morty_app/data/db/hive_constants.dart';
import 'package:rick_and_morty_app/data/db/i_storage.dart';
import 'package:rick_and_morty_app/data/db/i_storage_factory.dart';
import 'package:rick_and_morty_app/data/db/models/character_model.dart';
import 'package:rick_and_morty_app/domain/contracts/i_character_repository.dart';
import 'package:rick_and_morty_app/domain/entities/character.dart';
import 'package:rick_and_morty_app/domain/entities/characters.dart';

class CharacterRepository implements ICharacterRepository {
  final RickAndMortyApi rickAndMortyApi;
  final DefaultCacheManager cacheManager;
  final IStorageFactory storageFactory;

  const CharacterRepository({
    required this.rickAndMortyApi,
    required this.cacheManager,
    required this.storageFactory,
  });

  @override
  Future<Either<RickAndMortyException, Characters>> getCharacters(
    String filterName,
  ) async {
    try {
      final response = await rickAndMortyApi.getCharacters(filterName);
      return right(response.toDomain());
    } on RickAndMortyException catch (e) {
      log.error(e.message);
      return left(e);
    }
  }

  @override
  Future<Either<RickAndMortyException, Characters>> getCharacterHints(
    String filterName,
  ) {
    // TODO: implement getCharacterHints
    throw UnimplementedError();
  }

  @override
  Future<void> cacheSingleCharacter(Character character) async {
    final cachedImage = await _downloadAndCacheImage(character.image);

    // Todo: check the uniqueness of character id
    return _getStorage().put(
      character.id.toString(),
      CharacterModel.fromDomain(character, cachedImage.fileId.value),
    );
  }

  @override
  Future<Either<RickAndMortyException, List<Character>>>
      getAllCachedCharacters() async {
    try {
      final characters = await _getAllCharacters().toList();
      return right(characters);
    } on RickAndMortyException catch (e) {
      log.error(e.message);
      return left(e);
    }
  }

  Stream<Character> _getAllCharacters() async* {
    final storage = _getStorage();
    final characterIds = await storage.getKeys();

    for (final id in characterIds) {
      final characterModel = await storage.get(id);

      if (characterModel != null) {
        final cachedImage =
            await _getImageFileFromCache(characterModel.cachedImageId);

        yield characterModel.toDomain().copyWith(cachedImage: cachedImage);
      }
    }
  }

  Future<CachedImage> _downloadAndCacheImage(
    String imageUrl,
  ) async {
    final fileId = UniqueId.fromUrl(imageUrl);
    final file = await cacheManager.downloadFile(imageUrl, key: fileId.value);

    log.debug('Image from $imageUrl was cached locally');

    return CachedImage(fileId: fileId, imageFile: file.file);
  }

  Future<CachedImage?> _getImageFileFromCache(
    String fileId,
  ) async {
    final file = await cacheManager.getFileFromCache(fileId);

    if (file != null) {
      return CachedImage(
        fileId: UniqueId.fromUniqueString(fileId),
        imageFile: file.file,
      );
    }

    log.warning('File was not found in the cache');
  }

  IStorage<CharacterModel> _getStorage() =>
      storageFactory.getStorage<CharacterModel>(HiveBoxNames.characters);
}
