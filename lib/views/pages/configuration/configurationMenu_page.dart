import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/configuration_controller.dart';

class ConfigurationMenu extends StatelessWidget {
  const ConfigurationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SpeedDial(
          backgroundColor: Get.isDarkMode
              ? const Color.fromARGB(255, 61, 61, 61)
              : Colors.white,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: Icon(Icons.add,
                  color: Colors.white,
                  size:
                      Get.find<ConfigurationController>().menuButtonSize.value),
              label: 'add'.tr,
              labelStyle: TextStyle(
                  backgroundColor: Get.isDarkMode
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight,
                  fontSize: Get.find<ConfigurationController>().textSize.value),
              onTap: () {
                Get.find<ConfigurationController>().increaseSize();
              },
              backgroundColor: const Color.fromARGB(255, 35, 216, 29),
              labelBackgroundColor: Get.isDarkMode
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorLight,
              shape: const CircleBorder(),
            ),
            SpeedDialChild(
              child: Icon(Icons.remove,
                  color: Colors.white,
                  size:
                      Get.find<ConfigurationController>().menuButtonSize.value),
              label: 'remove'.tr,
              labelStyle: TextStyle(
                  backgroundColor: Get.isDarkMode
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight,
                  fontSize: Get.find<ConfigurationController>().textSize.value),
              onTap: () {
                Get.find<ConfigurationController>().decreaseSize();
              },
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              labelBackgroundColor: Get.isDarkMode
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorLight,
              shape: const CircleBorder(),
            ),
            SpeedDialChild(
              child: Icon(
                Get.isDarkMode
                    ? Icons.light_mode
                    : Icons
                        .dark_mode, // Cambia el icono dependiendo del tema actual
                color: Colors.grey[850],
                size: Get.find<ConfigurationController>().menuButtonSize.value,
              ),
              label: Get.isDarkMode
                  ? 'Modo claro'
                  : 'Modo oscuro', // Cambia la etiqueta dependiendo del tema actual
              labelStyle: TextStyle(
                backgroundColor: Get.isDarkMode
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorLight,
                fontSize: Get.find<ConfigurationController>().textSize.value,
              ),
              onTap: () {
                Get.changeTheme(
                  // Cambia el tema
                  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
                );
              },
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              labelBackgroundColor: Get.isDarkMode
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).primaryColorLight,
              shape: const CircleBorder(),
            ),
          ],
        ));
  }
}
