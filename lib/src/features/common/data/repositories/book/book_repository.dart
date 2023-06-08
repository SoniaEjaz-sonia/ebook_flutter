import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:xml2json/xml2json.dart';

import '../../failures/http_failure.dart';
import '../../models/category_feed.dart';

abstract class BookRepository {
  final Dio httpClient;

  const BookRepository(this.httpClient);

  Future<Either<HttpFailure, CategoryFeed>> getCategory(String url) async {
    try {
      final res = await httpClient.get(url);
      CategoryFeed category;
      Xml2Json xml2json = Xml2Json();
      xml2json.parse(res.data.toString());
      var json = jsonDecode(xml2json.toGData());
      category = CategoryFeed.fromJson(json as Map<String, dynamic>);
      return right(category);
    } on DioError catch (error) {
      final statusCode = error.response?.statusCode ?? 500;
      if (statusCode == 404) {
        return left(HttpFailure.notFound);
      }
      return left(HttpFailure.unknown);
    }
  }
}
