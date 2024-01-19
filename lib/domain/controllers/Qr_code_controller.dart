import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/utils/Utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_control_aplication/services/sync_service.dart';
import 'package:flutter_control_aplication/services/websocket_service.dart';

class QrCodeController extends GetxController {
  // Aquí puedes agregar tus variables observables, métodos, etc.
  late TextEditingController codeController;
  final showQr = false.obs;
  RxString code = ''.obs;
  late Map data;
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

  void gotoControll() {
    Get.toNamed('/control', arguments: data);
  }

  Future<void> saveQrCode() async {
    // Aquí puedes agregar el código que necesites para escanear el código QR
    if (codeController.text.isNotEmpty) {
      // y guardar el resultado en la variable code
      code.value = codeController.text;
      // showQr.value = true;
      gotoControll();
      return;
    } else {
      Util.showError('empty_qr_code'.tr);
    }
  }

  Future<void> scannQrCode() async {
    var status = await Permission.storage.status;
    if (status.isDenied) {
      // Si no tienes permiso para la cámara, solicítalo.
      var result = await Permission.camera.request();
      if (result.isGranted) {
        // Permiso otorgado, puedes abrir la pantalla de escaneo de códigos QR aquí
        String? scanResult = await scanner.scan();
        if (scanResult != null) {
          data = jsonDecode(scanResult);
          connectWebSocket();
          // codeController.text = scanResult.toString();
          // Util.showInfo(scanResult.toString());
          // code.value = codeController.text;
        }
      } else {
        // Permiso denegado por el usuario
        Util.showError('Necesitas permiso para acceder a la cámara');
      }
    } else {
      // Permiso otorgado, puedes abrir la pantalla de escaneo de códigos QR aquí
      String? scanResult = await scanner.scan();
      if (scanResult != null) {
        data = jsonDecode(scanResult);
        connectWebSocket();
        // codeController.text = scanResult.toString();

        // Util.showInfo(scanResult.toString());
        // code.value = codeController.text;
      }
    }
  }

  void connectWebSocket() async {
    // Crear una instancia de WebSocketService
    WebSocketService webSocketService = WebSocketService();

    // Asignar la URL
    String url = data['url'];

    // Llamar a connectToWebSocket en WebSocketService
    await webSocketService.connectToWebSocket(url);
    gotoControll();
  }

  Future<Map> getImageBytes() async {
    final requestParameters = {'id': 1};
    Map pdfBytes = await syncLocalData.imageBytes(
        'http://192.168.18.15:8000/Alausi/api/forms/image/', requestParameters);
    return pdfBytes;
  }
}
