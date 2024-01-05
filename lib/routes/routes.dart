import 'package:get/get.dart';
import 'package:flutter_control_aplication/views/pages/QrCode/Qr_code_page.dart';
import 'package:flutter_control_aplication/views/pages/QrCode/Qr_code_binding.dart';
import 'package:flutter_control_aplication/views/pages/Controll/controll_page.dart';
import 'package:flutter_control_aplication/views/pages/Controll/controll_binding.dart';

class AppControlRoutes {
  static const String qrCode = '/qr_code';
  static const String control = '/control';
}

class AppControlPages {
  static final pages = [
    GetPage(
      name: AppControlRoutes.qrCode,
      page: () => QrCodePage(),
      binding: QrCodeBinding(),
    ),
    GetPage(
      name: AppControlRoutes.control,
      page: () => ControllPage(),
      binding: ControllBinding(),
    )
    // Aquí puedes agregar más páginas si lo necesitas
  ];
}// TODO Implement this library.