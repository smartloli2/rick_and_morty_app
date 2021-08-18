import 'package:dartz/dartz.dart';
import 'package:rick_and_morty_app/data/repositories/search_request_repository.dart';
import 'package:rick_and_morty_app/domain/entities/search_request.dart';

abstract class ISearchRequestRepository {
  Future<Either<SearchRequestException, void>> saveRequest(
    SearchRequest request,
  );

  Future<Either<SearchRequestException, void>> deleteRequest(
    SearchRequest request,
  );

  Future<Either<SearchRequestException, List<SearchRequest>>> getAllRequests();
}
