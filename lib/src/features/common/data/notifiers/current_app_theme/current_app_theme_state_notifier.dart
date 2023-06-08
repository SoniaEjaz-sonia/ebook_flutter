import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/current_app_theme_service.dart';

class CurrentAppThemeStateNotifier extends StateNotifier<CurrentAppTheme> {
  final CurrentAppThemeService _currentAppThemeService;

  CurrentAppThemeStateNotifier({
    required CurrentAppThemeService currentAppThemeService,
  })  : _currentAppThemeService = currentAppThemeService,
        super(currentAppThemeService.getCurrentAppTheme());

  Future<void> updateCurrentAppTheme(bool isDarkMode) async {
    final success = await _currentAppThemeService.setCurrentAppTheme(isDarkMode);

    if (success && mounted) {
      state = isDarkMode ? CurrentAppTheme.dark : CurrentAppTheme.light;
    }
  }
}

enum CurrentAppTheme { light, dark }

final currentAppThemeStateNotifierProvider =
    StateNotifierProvider.autoDispose<CurrentAppThemeStateNotifier, CurrentAppTheme>(
  (ref) => CurrentAppThemeStateNotifier(
    currentAppThemeService: ref.read(currentAppThemeServiceProvider),
  ),
);
