import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/Qr_code_controller.dart'; // Asegúrate de importar tu controlador

class QrCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QrCodeController>(() => QrCodeController());
  }
}
