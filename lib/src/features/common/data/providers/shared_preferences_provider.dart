import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../local/local_storage.dart';

final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => LocalStorage().getSharedPreferences()!);
