import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class MyZoomDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();
  Rxn<User?> user = Rxn();

  @override
  void onReady() {
    user.value = Get.find<AuthController>().getUser();
    super.onReady();
  }

  void toogleDrawer() {
    zoomDrawerController.toggle?.call();
    update();
  }

  void signOut() {
    Get.find<AuthController>().signOut();
  }

  void signIn() {}

  void github() {
    _launch(Uri(path: "https://www.google.com"));
  }

  void facebook() {
    _launch(Uri(path: "https://www.facebook.com"));
  }

  void email() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'adrienrossignol@outlook.fr'
    );
    _launch(emailLaunchUri);
  }

  Future<void>_launch(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'could not launch $url';
    }
  }
}
