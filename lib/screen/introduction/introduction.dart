import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:test_app/configs/themes/app_colors.dart';
import 'package:test_app/widgets/app_circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.star,
                size: 65
              ),
              const SizedBox(height: 40),
              const Text(
                "This is a studdy app You can use it as you want. If you understand how it works, you would be able to scale it.",
                style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              AppCircleButton(
                onTap: (() => null),
                child: const Icon(Icons.arrow_back_ios, size: 35),
              ),
            ],
          ),
        ),
      )
    );
  }
}
