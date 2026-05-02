import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../preferences/user_preferences.dart';

@module
abstract class PreferencesModule {
  @lazySingleton
  UserPreferences getUserPreferences(SharedPreferences sharedPreferences) =>
      UserPreferences(sharedPreferences);
}
