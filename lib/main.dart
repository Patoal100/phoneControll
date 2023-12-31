import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_control_aplication/routes/routes.dart';
import 'package:flutter_control_aplication/config/translation.dart';
import 'package:flutter_control_aplication/config/themes.dart';
import 'package:flutter_control_aplication/utils/main_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //: Previene la Rotación del dispositivo
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const ControllApp());
  // connectionStatus.initialize();
}

class ControllApp extends StatelessWidget {
  const ControllApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control Interactivo',
      translations: Translation(),
      locale: const Locale('es', 'ES'),
      fallbackLocale: const Locale('es', 'ES'),
      initialRoute: AppControlRoutes.qrCode,
      getPages: AppControlPages.pages,
      initialBinding: MainBinding(),
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      themeMode: ThemeMode.system,
    );
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Control Interactivo',
    //   home: Scaffold(
    //     body: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         const Text(
    //           'Bienvenido',
    //           style: TextStyle(
    //             fontSize: 20 * 1.3,
    //             // color: (Get.isDarkMode)
    //             //     ? Colors.white
    //             //     : Get.theme.primaryColor,
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         const TextField(
    //           decoration: InputDecoration(
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.all(Radius.circular(25)),
    //               borderSide: BorderSide(
    //                 width: 1,
    //                 color: Colors.red,
    //               ),
    //             ),
    //             hintText: 'Ingrese el código',
    //             labelText: 'Código',
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             ElevatedButton(
    //               onPressed: () {},
    //               child: const Text(
    //                 'Ingresar',
    //                 style: TextStyle(
    //                   fontSize: 20 * 1.3,
    //                   color: Colors.blueAccent,
    //                   // color: (Get.isDarkMode)
    //                   //     ? Colors.white
    //                   //     : Get.theme.primaryColor,
    //                 ),
    //               ),
    //             ),
    //             const SizedBox(width: 20),
    //             ElevatedButton(
    //               onPressed: () {},
    //               child: const Text(
    //                 'Limpiar',
    //                 style: TextStyle(
    //                   fontSize: 20 * 1.3,
    //                   color: Colors.blueAccent,
    //                   // color: (Get.isDarkMode)
    //                   //     ? Colors.white
    //                   //     : Get.theme.primaryColor,
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    //   // translations: Translation(),
    //   // locale: Locale('es', 'ES'),
    //   // fallbackLocale: const Locale('es', 'ES'),
    //   // initialRoute: IsMusRoutes.dashboard,
    //   // getPages: IsMusPages.pages,
    //   // initialBinding: MainBinding(),
    //   // theme: Themes.lightTheme,
    //   // darkTheme: Themes.darkTheme,
    //   // themeMode: ThemeMode.system,
    // );
  }
}
