import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/controll_controller.dart';
import 'package:flutter_control_aplication/views/pages/widgets/controll_botton_widget.dart';
import 'package:flutter_control_aplication/views/pages/widgets/clouds_decoration_widget.dart';

class ControllPage extends GetWidget<ControllController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      percentage: 0.35,
                      base64Image: '',
                      onPressed: () => Get.toNamed('/qr_code'),
                    ),
                    const SizedBox(width: 50),
                    CustomButton(
                      percentage: 0.35,
                      base64Image: '',
                      onPressed: () => Get.toNamed('/qr_code'),
                    ),
                  ],
                ),
              ],
            ))));
  }
}
