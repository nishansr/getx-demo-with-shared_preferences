import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groceryapp/viewmodel/time_controller.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/home');
    });
    final TimeController controller = Get.put(TimeController());

    return Obx(() => Scaffold(
          backgroundColor:
              controller.isDarkMode.value ? Colors.black : Colors.white,
          body: Center(
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
                controller.isDarkMode.value ? Colors.white : Colors.black,
                BlendMode.srcIn,
              ),
              child: SvgPicture.asset(
                "assets/logos/watch.svg",
                height: MediaQuery.of(context).size.height * 0.2,
              ),
            ),
          ),
        ));
  }
}
