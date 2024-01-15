import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.percentage,
      required this.base64Image,
      required this.onPressed});

  final double percentage;
  final String base64Image;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * percentage;
    // print(base64Image[base64Image.length - 1]);
    Image image = imageFromBase64String(base64Image);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: image.image,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        child: null,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: Colors.transparent,
          padding: const EdgeInsets.all(0),
        ),
        onPressed: () => onPressed(),
      ),
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
