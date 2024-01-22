import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/services/websocket_service.dart';
import 'package:vibration/vibration.dart';

class ControllController extends GetxController {
  // Aquí puedes agregar tus variables observables, métodos, etc.
  late TextEditingController codeController;
  final showQr = false.obs;
  RxString code = ''.obs;
  RxInt index = 0.obs;
  @override
  void onInit() {
    codeController = TextEditingController();
    super.onInit();
    // Aquí puedes agregar inicializaciones que necesites al crear la clase
  }

  Future<void> sendMessage(var message, Map cards) async {
    List<dynamic> card = cards.values.toList();
    // Crear una instancia de WebSocketService
    WebSocketService webSocketService = WebSocketService();

    webSocketService.sendMessage(message);

    if (card[index.value]['traduccion'] == message['message']) {
      index++;
    } else {
      var hasCustomVibrationsSupport =
          await Vibration.hasCustomVibrationsSupport();
      if (hasCustomVibrationsSupport != null && hasCustomVibrationsSupport) {
        Vibration.vibrate(duration: 1000);
      } else {
        Vibration.vibrate();
        await Future.delayed(const Duration(milliseconds: 500));
        Vibration.vibrate();
      }
    }
    if (index.value == 4) {
      index.value = 0;
      gotoQrCode();
    }
  }

  gotoQrCode() {
    Get.toNamed('/qr_code');
  }

  @override
  void onClose() {
    // Aquí puedes agregar limpiezas que necesites al cerrar la clase
    super.onClose();
  }
}
