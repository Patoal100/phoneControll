import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Util extends GetxController {
  static showError(String text) {
    Get.snackbar(
      'Error',
      text,
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 30,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.canvasColor,
      colorText: Get.isDarkMode ? Colors.white : Get.theme.primaryColor,
    );
  }

  static showWarm(String text) {
    Get.snackbar(
      '¡Advertencia!',
      text,
      icon: const Icon(
        Icons.warning,
        color: Colors.yellow,
        size: 30,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.canvasColor,
      colorText: Get.isDarkMode ? Colors.white : Get.theme.primaryColor,
    );
  }

  static showInfo(String text) {
    Get.snackbar(
      'Info',
      text,
      icon: const Icon(
        Icons.info_outline_rounded,
        color: Colors.blue,
        size: 30,
      ),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Get.theme.canvasColor,
      colorText: Get.isDarkMode ? Colors.white : Get.theme.primaryColor,
    );
  }
}

  /// Shows a pop-up dialog with a message and two buttons for the user to choose from.
  ///
  /// The pop-up dialog displays an icon, a message, and two buttons labeled "Yes" and "No".
  /// The user can click on either button to close the dialog and return a boolean value.
  ///
  /// The [message] parameter is the text to be displayed in the pop-up dialog.
  ///
  /// The [yes] parameter is the text to be displayed on the "Yes" button.
  ///
  /// The [no] parameter is the text to be displayed on the "No" button.
  ///
  /// The [iconName] parameter is the name of the icon to be displayed in the pop-up dialog.
  /// It defaults to 'info' if not specified.
  ///
  /// The [onYes] parameter is an optional callback function that is executed when the user clicks on the "Yes" button.
  ///
  /// Returns a [Future] that completes with a boolean value indicating whether the user clicked on the "Yes" button or not.