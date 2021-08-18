import 'package:dartz/dartz.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:rick_and_morty_app/core/exceptions/exception.dart';
import 'package:rick_and_morty_app/core/log/i_log.dart';
import 'package:rick_and_morty_app/data/db/hive_constants.dart';
import 'package:rick_and_morty_app/data/db/i_storage.dart';
import 'package:rick_and_morty_app/data/db/i_storage_factory.dart';
import 'package:rick_and_morty_app/data/db/models/search_request_model.dart';
import 'package:rick_and_morty_app/domain/contracts/i_search_request_repository.dart';
import 'package:rick_and_morty_app/domain/entities/search_request.dart';

class SearchRequestRepository implements ISearchRequestRepository {
  final IStorageFactory storageFactory;

  const SearchRequestRepository({
    required this.storageFactory,
  });

  @override
  Future<Either<SearchRequestException, void>> saveRequest(
    SearchRequest request,
  ) async {
    try {
      final result = await _getStorage().put(
        request.value,
        SearchRequestModel.fromDomain(request),
      );
      return right(result);
    } on SearchRequestException catch (e) {
      log.error(e.message);
      return left(e);
    }
  }

  @override
  Future<Either<SearchRequestException, void>> deleteRequest(
    SearchRequest request,
  ) async {
    try {
      final result = await _getStorage().remove(request.value);
      return right(result);
    } on SearchRequestException catch (e) {
      log.error(e.message);
      return left(e);
    }
  }

  @override
  Future<Either<SearchRequestException, List<SearchRequest>>>
      getAllRequests() async {
    try {
      final searchRequests = await _getAllSearchRequests().toList();
      return right(searchRequests);
    } on SearchRequestException catch (e) {
      log.error(e.message);
      return left(e);
    }
  }

  Stream<SearchRequest> _getAllSearchRequests() async* {
    final storage = _getStorage();
    final values = await storage.getKeys();

    for (final value in values) {
      final searchRequestModel = await storage.get(value);
      if (searchRequestModel != null) {
        yield searchRequestModel.toDomain();
      }
    }
  }

  IStorage<SearchRequestModel> _getStorage() =>
      storageFactory.getStorage<SearchRequestModel>(HiveBoxNames.searchRequest);
}

class SearchRequestException extends BussinessException {
  SearchRequestException(String message) : super(message);
}
