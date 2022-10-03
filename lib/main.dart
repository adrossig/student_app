import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/bindings/initial_bindings.dart';
import 'package:test_app/configs/themes/app_light_theme.dart';
import 'package:test_app/controllers/question_paper/data_upload_screen.dart';
import 'package:test_app/controllers/theme_controller.dart';
import 'package:test_app/firebase_options.dart';
import 'package:test_app/routes/routes.dart';
import 'package:test_app/screen/splash/splash_screen.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(GetMaterialApp(
//     home: DataUploaderScreen(),
//   ));
// }

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Get.find<ThemeController>().darkTheme,
      getPages: AppRoutes.routes(),
    );
  }
}
