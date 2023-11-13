import 'dart:async';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimeController extends GetxController {
  var currentTime = "".obs;
  var isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadDarkMode();
    updateTime();
  }

  Future<void> loadDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? savedIsDarkMode = prefs.getBool('isDarkMode');
    if (savedIsDarkMode != null) {
      isDarkMode.value = savedIsDarkMode;
    }
  }

  void updateTime() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (DateTime.now().hour < 12) {
        currentTime.value =
            "${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}";
      } else {
        currentTime.value =
            "${DateTime.now().hour - 12} : ${DateTime.now().minute} : ${DateTime.now().second}";
      }
    });
  }

  void toggleDarkMode() async {
    isDarkMode.toggle();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode.value);
  }
}
