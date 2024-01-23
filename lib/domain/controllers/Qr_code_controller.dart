import 'dart:async';
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
  bool isLoading = false;
  late String url;

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
    if (data['info'] != null) {
      Get.toNamed('/control', arguments: {'info': data['info'], 'url': url});
    }
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
          await createConnection(scanResult);
        }
      } else {
        // Permiso denegado por el usuario
        Util.showError('need_permission'.tr);
      }
    } else {
      // Permiso otorgado, puedes abrir la pantalla de escaneo de códigos QR aquí
      String? scanResult = await scanner.scan();
      if (scanResult != null) {
        await createConnection(scanResult);
      }
    }
  }

  Future<void> createConnection(scanResult) async {
    try {
      String connect = base64ToString(scanResult);
      String url = connect.split('|')[0].trim();
      String token = connect.split('|')[1];
      data = await postConection(url, token);
      isLoading = true; // Comienza la carga
      update(); // Actualiza la interfaz de usuario
      await connectWebSocket().timeout(const Duration(seconds: 10),
          onTimeout: () {
        throw TimeoutException(
            'La conexión ha tardado demasiado tiempo y se ha agotado el tiempo de espera.');
      });
      isLoading = false; // Termina la carga
      update(); // Actualiza la interfaz de usuario
      gotoControll();
    } catch (e) {
      isLoading = false; // Termina la carga
      update(); // Actualiza la interfaz de usuario
      if (e is TimeoutException) {
        Util.showError('try_again'
            .tr); // Muestra un error si la conexión tarda demasiado tiempo
      } else {
        if (data['message'] == null) {
          Util.showError('invalid_qr_code'.tr);
        } else {
          Util.showError('failed_websocket_connection'.tr);
        }
      }
      return;
    }
  }

  String base64ToString(String base64Str) {
    List<int> bytes = base64.decode(base64Str);
    String result = utf8.decode(bytes);
    return result;
  }

  Future<void> connectWebSocket() async {
    // Crear una instancia de WebSocketService
    WebSocketService webSocketService = WebSocketService();

    if (data['info']['info']['url_socket'] == null) {
      // Si no hay información, muestra un error
      Util.showError('invalid_qr_code'.tr);
      return;
    }
    // Asignar la URL
    String url = data['info']['info']['url_socket'];

    // Llamar a connectToWebSocket en WebSocketService
    bool isConnected = await webSocketService.connectToWebSocket(url);

    if (isConnected) {
      // Si la conexión fue exitosa, envía el código QR al servidor
      var message = {
        'motion': '',
        'isCorrect': null,
        'message': 'hide',
      };
      await Future.delayed(const Duration(seconds: 2));
      webSocketService.sendMessage(message);
    } else {
      // Si la conexión falló, muestra un error
      Util.showError('try_again'.tr);
    }
  }

  Future<Map> postConection(String url, String token) async {
    final requestParameters = {'token': token};
    Map pdfBytes = await syncLocalData.jsonData(url, requestParameters);
    return pdfBytes;
  }
}
