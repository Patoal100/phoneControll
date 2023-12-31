import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/Qr_code_controller.dart'; // Asegúrate de importar tu controlador
import 'package:flutter_control_aplication/views/pages/widgets/input_text_code_widget.dart'; // Asegúrate de importar tu controlador

class QrCodePage extends GetWidget<QrCodeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('welcome'.tr),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: [
                  const Text('QR Code Page'),
                  const SizedBox(height: 20),
                  InputTextCode(
                    hintText: 'code'.tr,
                    labelText: 'Ingrese el codigo'.tr,
                    hasIcon: true,
                    icon: Icons.qr_code,
                    ctrlValue: controller.codeController,
                    height: 20.0,
                    isPassword: false,
                  )
                ],
              ),
            )));
  }
}
