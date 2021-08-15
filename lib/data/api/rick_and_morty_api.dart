import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/core/exceptions/exception.dart';
import 'package:rick_and_morty_app/data/api/models/character_hint.dart';
import 'package:rick_and_morty_app/data/api/models/characters.dart';

import 'i_rick_and_morty_api.dart';

class RickAndMortyApi implements IRickAndMortyApi {
  static const String rickAndMortyApiBaseUrl =
      'https://rickandmortyapi.com/api/';

  final Dio dio;
  // Todo: check the internet connection and throw corresponding exception
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

  // Todo: replace filterName on CharacterFilter
  @override
  Future<Characters> getCharacters(String filterName) async {
    try {
      final Response response = await dio.get('character?name=$filterName');

      if (response.statusCode == 200) {
        return Characters.fromJson(response.data);
      }

      throw RickAndMortyException(
        'Server request failed: status code: ${response.statusCode},'
        ' data: ${response.data}',
      );
    } on DioError catch (e) {
      throw RickAndMortyException(e.message);
    }
  }

  @override
  Future<List<CharacterHint>> getCharacterHints(
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
          .map((e) => CharacterHint.fromJson(e))
          .toList();
    }

    throw RickAndMortyException(
      'Server request failed: status code: ${response.statusCode},'
      ' data: ${response.data}',
    );
  }
}

class RickAndMortyException extends BussinessException {
  RickAndMortyException(String message) : super(message);
}
