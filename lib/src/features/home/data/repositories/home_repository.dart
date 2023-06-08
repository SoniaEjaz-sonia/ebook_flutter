import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/constants/api.dart';
import '../../../common/data/failures/http_failure.dart';
import '../../../common/data/models/category_feed.dart';
import '../../../common/data/providers/dio_provider.dart';
import '../../../common/data/repositories/book/book_repository.dart';

class HomeRepository extends BookRepository {
  HomeRepository(super.httpClient);

  Future<Either<HttpFailure, CategoryFeed>>? getPopularHomeFeed() {
    final failureOrSuccess = getCategory(ApiEndpoints.popular);
    return failureOrSuccess;
  }

  Future<Either<HttpFailure, CategoryFeed>> getRecentHomeFeed() async {
    final failureOrSuccess = await getCategory(ApiEndpoints.recent);
    return failureOrSuccess;
  }
}

final homeRepositoryProvider = Provider.autoDispose<HomeRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return HomeRepository(dio);
});
