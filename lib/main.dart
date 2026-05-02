import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'data/remote/supabase/supabase_manager.dart';
import 'domain/di/dependency_injection.dart';
import 'presentation/app_setter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  await SupabaseManager.initialize();

  // Configure DI
  await configureDependencies();

  // Portrait only
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const Eeyadty());
}
