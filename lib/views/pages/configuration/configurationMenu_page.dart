import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/configuration_controller.dart';

class ConfigurationMenu extends StatelessWidget {
  const ConfigurationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: Icon(Icons.add,
                  color: Colors.white,
                  size:
                      Get.find<ConfigurationController>().menuButtonSize.value),
              label: 'add'.tr,
              labelStyle: TextStyle(
                  fontSize: Get.find<ConfigurationController>().textSize.value),
              onTap: () {
                Get.find<ConfigurationController>().increaseSize();
              },
              backgroundColor: const Color.fromARGB(255, 35, 216, 29),
              shape: const CircleBorder(),
            ),
            SpeedDialChild(
              child: Icon(Icons.remove,
                  color: Colors.white,
                  size:
                      Get.find<ConfigurationController>().menuButtonSize.value),
              label: 'remove'.tr,
              labelStyle: TextStyle(
                  fontSize: Get.find<ConfigurationController>().textSize.value),
              onTap: () {
                Get.find<ConfigurationController>().decreaseSize();
              },
              backgroundColor: const Color.fromARGB(255, 255, 0, 0),
              shape: const CircleBorder(),
            ),
          ],
        ));
  }
}
