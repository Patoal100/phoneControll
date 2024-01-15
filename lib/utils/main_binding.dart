import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/configuration_controller.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    Get.put(ConfigurationController());
    // Get.lazyPut<LocalStorageRepositoryInterface>(
    //     () => LocalStorageRepositoryImplementation());
  }
}
