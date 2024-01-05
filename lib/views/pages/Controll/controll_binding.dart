import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/controll_controller.dart';

class ControllBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ControllController>(() => ControllController());
  }
}
