import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/exceptions/exception.dart';
import 'package:rick_and_morty_app/data/api/models/character_hint_dto.dart';
import 'package:rick_and_morty_app/data/api/models/all_characters_dto.dart';

import 'i_rick_and_morty_api.dart';

class RickAndMortyApi implements IRickAndMortyApi {
  static const String rickAndMortyApiBaseUrl =
      'https://rickandmortyapi.com/api/';

  final Dio dio;
  // Todo: check the internet connection and throw a corresponding exception
  // final Connectivity connectivity;

  RickAndMortyApi({
    required this.dio,
    // required this.connectivity,
  }) {
    dio.options = BaseOptions(
      baseUrl: rickAndMortyApiBaseUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  @override
  Future<AllCharactersDto> getCharacters(String filterName) =>
      _getCharactersViaUrl('character?name=$filterName');

  @override
  Future<AllCharactersDto> getMoreCharacters(String url) =>
      _getCharactersViaUrl(url);

  @override
  Future<List<CharacterHintDto>> getCharacterHints(
    String filterName,
  ) async {
    final gqlQuery =
        '{ characters(filter: { name: "$filterName" }){ results { id name} } }';

    final response = await dio.post(
      'graphql',
      data: jsonEncode({
        "query": gqlQuery,
      }),
    );

    if (response.statusCode == 200) {
      return (response.data['data']['characters']['results'] as List)
          .map((e) => CharacterHintDto.fromJson(e))
          .toList();
    }

    throw RickAndMortyException(
      'Server request failed: status code: ${response.statusCode},'
      ' data: ${response.data}',
    );
  }

  Future<AllCharactersDto> _getCharactersViaUrl(String url) async {
    try {
      final Response response = await dio.get(url);

      if (response.statusCode == 200) {
        return AllCharactersDto.fromJson(response.data);
      }

      // Todo: добавить обработку ошибок (не удалось найти, неизвестная и т.д.)

      throw RickAndMortyException(
        'Server request failed: status code: ${response.statusCode},'
        ' data: ${response.data}',
      );
    } on DioError catch (e) {
      throw RickAndMortyException(e.message);
    }
  }
}

class RickAndMortyException extends BussinessException {
  RickAndMortyException(String message) : super(message);
}
