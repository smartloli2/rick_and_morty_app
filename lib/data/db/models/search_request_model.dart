import 'package:hive/hive.dart';
import 'package:rick_and_morty_app/domain/entities/search_request.dart';

import '../hive_constants.dart';

part 'search_request_model.g.dart';

@HiveType(typeId: HiveTypeIds.searchRequest)
class SearchRequestModel {
  @HiveField(0)
  final String value;

  @HiveField(1)
  final DateTime createdAtUtc;

  SearchRequestModel({
    required this.value,
    required this.createdAtUtc,
  });

  SearchRequest toDomain() => SearchRequest(
        value: value,
        createdAtUtc: createdAtUtc,
      );

  factory SearchRequestModel.fromDomain(SearchRequest searchRequest) =>
      SearchRequestModel(
        value: searchRequest.value,
        createdAtUtc: searchRequest.createdAtUtc,
      );
}
