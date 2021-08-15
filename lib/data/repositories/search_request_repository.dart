// class SearchRequestRepository {
//   Future<Either<RickAndMortyException, Characters>> getCharacters(
//     String filterName,
//   ) async {
//     try {
//       final response = await rickAndMortyApi.getCharacters(filterName);
//       return right(response);
//     } on RickAndMortyException catch (e) {
//       log.error(e.toString());
//       return left(e);
//     }
//   }
// }
