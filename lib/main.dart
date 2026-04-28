import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:smis_mobile/bindings/intail_binding.dart';
import 'package:smis_mobile/core/theme/app_theme.dart';
import 'package:smis_mobile/routes/app_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 👇 Lock orientation
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

      // Initialize Supabase or other services here if needed
  await dotenv.load(fileName: '.env');
  await Supabase.initialize(
    url: dotenv.env['PROJECT_URL']!,
    anonKey: dotenv.env['API_KEY']!,
  );

  runApp(const MyApp());
  // runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SMIS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialBinding: IntailBinding(),
      initialRoute: '/',
      getPages: AppPages.routes,
    );
  }
}
