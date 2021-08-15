import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:rick_and_morty_app/data/api/models/character_hint.dart';
import 'package:rick_and_morty_app/data/api/models/characters.dart';
import 'package:rick_and_morty_app/data/api/rick_and_morty_api.dart';

import '../fixtures/fixture_reader.dart';

import 'rick_and_morty_api_test.mocks.dart';

enum HttpRequestType { get, post }

@GenerateMocks([], customMocks: [MockSpec<Dio>(as: #MockDioHttpClient)])
void main() {
  late RickAndMortyApi rickAndMortyApi;
  late MockDioHttpClient mockDioHttpClient;

  setUp(() {
    mockDioHttpClient = MockDioHttpClient();
    rickAndMortyApi = RickAndMortyApi(dio: mockDioHttpClient);
  });

  void _setUpDioOptions() {
    when(mockDioHttpClient.options).thenAnswer(
      (_) => BaseOptions(
        baseUrl: RickAndMortyApi.rickAndMortyApiBaseUrl,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ),
    );
  }

  void _setUpMockDioHttpSuccess200(
    String filterName,
    HttpRequestType requestType, {
    RequestOptions? requestOptions,
  }) {
    _setUpDioOptions();

    switch (requestType) {
      case HttpRequestType.get:
        when(mockDioHttpClient.get(any)).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: jsonDecode(
                fixture('filtered_characters_on_request_$filterName.json')),
            requestOptions: requestOptions ?? RequestOptions(path: ''),
          ),
        );
        return;

      case HttpRequestType.post:
        when(mockDioHttpClient.post(any, data: anyNamed('data'))).thenAnswer(
          (_) async => Response(
            statusCode: 200,
            data: jsonDecode(fixture(
                'filtered_character_hints_on_request_$filterName.json')),
            requestOptions: requestOptions ?? RequestOptions(path: ''),
          ),
        );
        return;
    }
  }

  void _setUpMockDioHttpFailure404(
    HttpRequestType requestType, {
    RequestOptions? requestOptions,
  }) {
    _setUpDioOptions();

    switch (requestType) {
      case HttpRequestType.get:
        when(mockDioHttpClient.get(any)).thenAnswer(
          (_) async => Response(
            data: json.decode(fixture('characters_404_rest_response.json')),
            statusCode: 404,
            requestOptions: requestOptions ?? RequestOptions(path: ''),
          ),
        );
        return;

      case HttpRequestType.post:
        when(mockDioHttpClient.post(any, data: anyNamed('data'))).thenAnswer(
          (_) async => Response(
            data: json.decode(fixture('characters_404_graphql_response.json')),
            statusCode: 404,
            requestOptions: requestOptions ?? RequestOptions(path: ''),
          ),
        );
        return;
    }
  }

  group('getCharacters', () {
    const filterName = 'rick';
    final charactersModel = Characters.fromJson(json
        .decode(fixture('filtered_characters_on_request_$filterName.json')));

    test(
      'should perform a GET request on a URL with filter name query',
      () async {
        // arrange
        _setUpMockDioHttpSuccess200(filterName, HttpRequestType.get);

        // act
        await rickAndMortyApi.getCharacters(filterName);

        // assert
        verify(mockDioHttpClient.get('character?name=$filterName'));
      },
    );

    test(
      'should return Characters when the response code is 200 (success)',
      () async {
        // arrange
        _setUpMockDioHttpSuccess200(filterName, HttpRequestType.get);

        // act
        final result = await rickAndMortyApi.getCharacters(filterName);

        // assert
        expect(result, equals(charactersModel));
      },
    );

    test(
      'should throw a RickAndMortyApiException when the response code is 404 or other',
      () async {
        // arrange
        _setUpMockDioHttpFailure404(HttpRequestType.get);

        // act
        final call = rickAndMortyApi.getCharacters;

        // assert
        expect(() => call(filterName),
            throwsA(const TypeMatcher<RickAndMortyException>()));
      },
    );
  });

  group('getCharacterHints', () {
    const filterName = 'morty';

    final List<CharacterHint> characterHints = (json.decode(fixture(
      'filtered_character_hints_on_request_$filterName.json',
    ))['data']['characters']['results'] as List)
        .map<CharacterHint>((e) => CharacterHint.fromJson(e))
        .toList();

    test(
      'should perform a GraphQL request',
      () async {
        // arrange
        _setUpMockDioHttpSuccess200(filterName, HttpRequestType.post);

        // act
        await rickAndMortyApi.getCharacterHints(filterName);

        // assert
        verify(mockDioHttpClient.post('graphql', data: anyNamed('data')));
      },
    );

    test(
      'should return list of [CharacterHint] when the response code is 200 (success)',
      () async {
        // arrange
        _setUpMockDioHttpSuccess200(filterName, HttpRequestType.post);

        // act
        final result = await rickAndMortyApi.getCharacterHints(filterName);

        // assert
        expect(result, equals(characterHints));
      },
    );

    test(
      'should throw a [RickAndMortyException] when the response code is 404 or other',
      () async {
        // arrange
        _setUpMockDioHttpFailure404(HttpRequestType.post);

        // act
        final call = rickAndMortyApi.getCharacterHints;

        // assert
        expect(() => call(filterName),
            throwsA(const TypeMatcher<RickAndMortyException>()));
      },
    );
  });
}
