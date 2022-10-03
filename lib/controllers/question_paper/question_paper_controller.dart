import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:test_app/controllers/auth_controller.dart';
import 'package:test_app/firebase_ref/references.dart';
import 'package:test_app/models/question_paper_model.dart';
import 'package:test_app/services/firebase_storage_service.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <QuestionPaperModel>[].obs;

  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = [
      "biology",
      "chemistry",
      "maths",
      "physics"
    ];
    try {
      QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch(e) {
      //AppLogger.e(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper, bool tryAgain = false}) {
    AuthController _authController = Get.find();
    if (_authController.isLoggedIn()) {
      if (tryAgain) {
        Get.back();
        //Get.offNamed(page);
      } else {
        // Get.toNamed();
      }
    } else {
      print("${paper.title}");
      _authController.showLoginAlertDialogue();
    }
  }
}
