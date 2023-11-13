import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceryapp/viewmodel/time_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TimeController controller = Get.put(TimeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor:
            controller.isDarkMode.value ? Colors.black : Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                controller.currentTime.value,
                style: GoogleFonts.orbitron(
                  fontSize: MediaQuery.of(context).size.width * 0.15,
                  fontWeight: FontWeight.bold,
                  color:
                      controller.isDarkMode.value ? Colors.white : Colors.black,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Switch(
              value: controller.isDarkMode.value,
              activeColor: Colors.red,
              onChanged: (value) {
                controller.toggleDarkMode();
              },
            ),
          ],
        ),
      ),
    );
  }
}
