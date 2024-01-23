import 'package:flutter/material.dart';
import 'package:flutter_control_aplication/views/pages/widgets/sound_button_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/Qr_code_controller.dart'; // Asegúrate de importar tu controlador
import 'package:flutter_control_aplication/views/pages/widgets/clouds_decoration_widget.dart'; // Asegúrate de importar tu controlador
import 'package:flutter_control_aplication/views/pages/widgets/controll_botton_widget.dart'; // Asegúrate de importar tu controlador
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_control_aplication/views/pages/configuration/configurationMenu_page.dart';
import 'package:flutter_control_aplication/domain/controllers/configuration_controller.dart';
import 'package:flutter_tts/flutter_tts.dart';

class QrCodePage extends GetWidget<QrCodeController> {
  QrCodePage({super.key});

  final FlutterTts flutterTts = FlutterTts();

  speak() async {
    await flutterTts.speak('welcome'.tr);
  }

  @override
  Widget build(BuildContext context) {
    speak();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('welcome'.tr),
      // ),
      body: _decorateBody(),
      floatingActionButton: const ConfigurationMenu(),
    );
  }

  Widget _decorateBody() {
    return Stack(
      children: [
        Obx(
          () => CustomPaint(
            size: Size(
                double.infinity,
                50 *
                    Get.find<ConfigurationController>()
                        .itemSize
                        .value), // Tamaño del CustomPaint superior
            painter: MyCustomPainter(), // Tu clase CustomPainter
          ),
        ),
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Obx(() => Column(children: [
                      Visibility(
                        visible: controller.showQr.value,
                        child: QrImageView(
                          data: controller.code.value,
                          backgroundColor: Colors.white,
                          size: 200 *
                              Get.find<ConfigurationController>()
                                  .itemSize
                                  .value,
                        ),
                      ),
                      SizedBox(
                          height: 90 *
                              Get.find<ConfigurationController>()
                                  .itemSize
                                  .value),
                      controller.isLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              percentage: 0.35 *
                                  Get.find<ConfigurationController>()
                                      .itemSize
                                      .value,
                              onPressed: () => controller.scannQrCode(),
                              hasText: false,
                              hasIcon: true,
                              icon: Icons.qr_code,
                            ),
                      SizedBox(
                          height: 30 *
                              Get.find<ConfigurationController>()
                                  .itemSize
                                  .value),
                    ])))));
  }
}
