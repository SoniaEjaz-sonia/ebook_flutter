import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../remote/app_dio.dart';

final dioProvider = Provider<Dio>((ref) => AppDio.getInstance());
