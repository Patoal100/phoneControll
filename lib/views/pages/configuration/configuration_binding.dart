import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/configuration_controller.dart';
import 'package:flutter_control_aplication/views/pages/configuration/configurationMenu_page.dart';

class ConfigurationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConfigurationController>(() => ConfigurationController());
    Get.put<ConfigurationMenu>(const ConfigurationMenu());
  }
}
