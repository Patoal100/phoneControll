import 'package:flutter/material.dart';
import 'package:flutter_control_aplication/views/pages/widgets/sound_button_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_control_aplication/domain/controllers/controll_controller.dart';
import 'package:flutter_control_aplication/views/pages/widgets/controll_botton_widget.dart';
import 'package:flutter_control_aplication/views/pages/widgets/clouds_decoration_widget.dart';
import 'package:flutter_control_aplication/views/pages/configuration/configurationMenu_page.dart';
import 'package:flutter_control_aplication/domain/controllers/configuration_controller.dart';

// ignore: must_be_immutable
class ControllPage extends GetWidget<ControllController> {
  late Map result;
  late Map cards;

  ControllPage({super.key});
  @override
  Widget build(BuildContext context) {
    result = Get.arguments['info'];
    cards = controller.getCards(result['cards'], Get.arguments['url']);
    return Scaffold(
      body: _decorateBody(),
      floatingActionButton: const ConfigurationMenu(),
    );
  }

  Widget _decorateBody() {
    return Stack(
      children: [
        Obx(() => CustomPaint(
              size: Size(
                  double.infinity,
                  50 *
                      Get.find<ConfigurationController>()
                          .itemSize
                          .value), // Tamaño del CustomPaint superior
              painter: MyCustomPainter(), // Tu clase CustomPainter
            )),
        _buildBody(),
      ],
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
                child: Obx(() => Column(
                      children: [
                        SizedBox(
                            height: 80 *
                                Get.find<ConfigurationController>()
                                    .itemSize
                                    .value),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                                child: Column(children: [
                              SoundButton(
                                  link: cards[result['options']
                                      [controller.index.value][0]],
                                  percentage: 0.05 *
                                      Get.find<ConfigurationController>()
                                          .itemSize
                                          .value),
                              CustomButton(
                                percentage: 0.35 *
                                    Get.find<ConfigurationController>()
                                        .itemSize
                                        .value,
                                buttonText: result['options']
                                    [controller.index.value][0],
                                onPressed: () => controller.sendMessage({
                                  'motion': 'left',
                                  'message': result['options']
                                      [controller.index.value][0],
                                  'isCorrect': null
                                }, result['cards']),
                                hasText: true,
                                hasIcon: false,
                              )
                            ])),
                            SizedBox(
                                width: 50 *
                                    Get.find<ConfigurationController>()
                                        .itemSize
                                        .value),
                            Flexible(
                                child: Column(children: [
                              SoundButton(
                                  link: cards[result['options']
                                      [controller.index.value][1]],
                                  percentage: 0.05 *
                                      Get.find<ConfigurationController>()
                                          .itemSize
                                          .value),
                              CustomButton(
                                percentage: 0.35 *
                                    Get.find<ConfigurationController>()
                                        .itemSize
                                        .value,
                                buttonText: result['options']
                                    [controller.index.value][1],
                                onPressed: () => controller.sendMessage({
                                  'motion': 'right',
                                  'message': result['options']
                                      [controller.index.value][1],
                                  'isCorrect': null
                                }, result['cards']),
                                hasText: true,
                                hasIcon: false,
                              )
                            ])),
                          ],
                        ),
                      ],
                    )))));
  }
}
