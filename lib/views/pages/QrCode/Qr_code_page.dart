import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/Qr_code_controller.dart'; // Asegúrate de importar tu controlador
import 'package:flutter_control_aplication/views/pages/widgets/input_text_code_widget.dart'; // Asegúrate de importar tu controlador
import 'package:flutter_control_aplication/views/pages/widgets/clouds_decoration_widget.dart'; // Asegúrate de importar tu controlador
import 'package:qr_flutter/qr_flutter.dart';

class QrCodePage extends GetWidget<QrCodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('welcome'.tr),
      // ),
      body: _decorateBody(),
    );
  }

  Widget _decorateBody() {
    return Stack(
      children: [
        CustomPaint(
          size: const Size(
              double.infinity, 50), // Tamaño del CustomPaint superior
          painter: MyCustomPainter(), // Tu clase CustomPainter
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
              child: Column(
                children: [
                  Obx(() => Visibility(
                        visible: controller.showQr.value,
                        child: QrImageView(
                          data: controller.code.value,
                          backgroundColor: Colors.white,
                          size: 300,
                        ),
                      )),
                  const SizedBox(height: 100),
                  InputTextCode(
                    hintText: 'code'.tr,
                    labelText: 'input_code'.tr,
                    hasIcon: true,
                    icon: Icons.qr_code,
                    ctrlValue: controller.codeController,
                    height: 20.0,
                    isPassword: false,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller.saveQrCode();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Text(
                          'join_game'.tr,
                          style: TextStyle(
                            fontSize: 15.0 * 1.3,
                            color: Get.isDarkMode
                                ? Colors.blue
                                : Get.theme.primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
