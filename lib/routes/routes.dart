import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:test_app/controllers/question_paper/question_paper_controller.dart';
import 'package:test_app/controllers/zoom_drawer_controller.dart';
import 'package:test_app/screen/home/home_screen.dart';
import 'package:test_app/screen/introduction/introduction.dart';
import 'package:test_app/screen/login/login_screen.dart';
import 'package:test_app/screen/splash/splash_screen.dart';

class AppRoutes {
  static List<GetPage> routes() => [
    GetPage(name: "/", page: () => const SplashScreen()),
    GetPage(name: "/introduction", page: () => const AppIntroductionScreen()),
    GetPage(name: HomeScreen.routeName, page: () => const HomeScreen(), binding: BindingsBuilder(() {
      Get.put(QuestionPaperController());
      Get.put(MyZoomDrawerController());
    })),
    GetPage(name: LoginScreen.routeName, page: () => const LoginScreen()),
  ];
}
