import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrCodeController extends GetxController {
  // Aquí puedes agregar tus variables observables, métodos, etc.
  late TextEditingController codeController;

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
