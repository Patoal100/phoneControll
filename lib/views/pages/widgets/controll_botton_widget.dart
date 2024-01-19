import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.percentage,
    required this.onPressed,
    required this.hasText,
    this.buttonText,
    required this.hasIcon,
    this.icon,
    // required this.shape,
  });

  final double percentage;
  final Function onPressed;
  final bool hasText;
  final String? buttonText;
  final bool hasIcon;
  final IconData? icon;
  // final BoxShape shape;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * percentage;

    if (hasText && buttonText == null) {
      //Get.snackbar('Error', 'hasIcon is true but icon is null');
      throw ArgumentError('hasText is true but buttonText is null');
    }

    if (hasIcon && icon == null) {
      //Get.snackbar('Error', 'hasIcon is true but icon is null');
      throw ArgumentError('hasIcon is true but icon is null');
    }
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(size * 0.1),
            ),
            padding: const EdgeInsets.all(0),
            backgroundColor: Get.isDarkMode
                ? Theme.of(context).primaryColor
                : const Color.fromARGB(255, 103, 194, 255),
          ),
          onPressed: () => onPressed(),
          child: hasText
              ? Text(
                  buttonText!,
                  style: TextStyle(
                    fontSize: 150 *
                        percentage, // Cambia el tamaño de la fuente según tus necesidades
                    color: Colors
                        .white, // Cambia el color del texto según tus necesidades
                    fontWeight:
                        FontWeight.bold, // Hace que el texto sea negrita
                  ),
                )
              : hasIcon
                  ? Icon(
                      icon,
                      size: size * 0.8,
                      color: Colors.white,
                    )
                  : const Text(
                      'Button',
                      style: TextStyle(
                        fontSize:
                            50, // Cambia el tamaño de la fuente según tus necesidades
                        color: Colors
                            .white, // Cambia el color del texto según tus necesidades
                        fontWeight:
                            FontWeight.bold, // Hace que el texto sea negrita
                      ),
                    )),
    );
  }

  Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }

  Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
