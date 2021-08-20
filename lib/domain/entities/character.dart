import 'package:flutter_cache_manager/file.dart';
import 'package:rick_and_morty_app/core/unique_id.dart';
import 'package:rick_and_morty_app/domain/entities/character_location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required CharacterLocation origin,
    required CharacterLocation location,
    required String image,
    CachedImage? cachedImage,
    required List<String> episode,
    required String url,
    required DateTime created,
  }) = _Character;

  // const Character({
  //   required this.id,
  //   required this.name,
  //   required this.status,
  //   required this.species,
  //   required this.type,
  //   required this.gender,
  //   required this.origin,
  //   required this.location,
  //   required this.image,
  //   this.cachedImage,
  //   required this.episode,
  //   required this.url,
  //   required this.created,
  // });

  // @override
  // List<Object?> get props => [id];
}

class CachedImage {
  final UniqueId fileId;
  final File? imageFile;

  const CachedImage({
    required this.fileId,
    this.imageFile,
  });
}
