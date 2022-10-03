import 'package:get/instance_manager.dart';
import 'package:test_app/controllers/auth_controller.dart';
import 'package:test_app/controllers/theme_controller.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
  }
}
