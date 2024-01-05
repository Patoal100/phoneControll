import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/utils/Utils.dart';
import 'package:permission_handler/permission_handler.dart';

class ControllController extends GetxController {
  // Aquí puedes agregar tus variables observables, métodos, etc.
  late TextEditingController codeController;
  final showQr = false.obs;
  RxString code = ''.obs;
  @override
  void onInit() {
    codeController = TextEditingController();
    super.onInit();
    // Aquí puedes agregar inicializaciones que necesites al crear la clase
  }

  @override
  void onClose() {
    // Aquí puedes agregar limpiezas que necesites al cerrar la clase
    super.onClose();
  }
}
