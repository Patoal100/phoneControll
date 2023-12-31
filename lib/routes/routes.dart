import 'package:get/get.dart';
import 'package:flutter_control_aplication/views/pages/QrCode/Qr_code_page.dart'; // Asegúrate de importar tu página
import 'package:flutter_control_aplication/views/pages/QrCode/Qr_code_binding.dart'; // Asegúrate de importar tu página

class AppControlRoutes {
  static const String qrCode = '/qr_code';
}

class AppControlPages {
  static final pages = [
    GetPage(
      name: AppControlRoutes.qrCode,
      page: () => QrCodePage(),
      binding: QrCodeBinding(),
    ),
    // Aquí puedes agregar más páginas si lo necesitas
  ];
}// TODO Implement this library.