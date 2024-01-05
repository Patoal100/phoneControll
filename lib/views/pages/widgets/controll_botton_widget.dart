import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.percentage,
      required this.base64Image,
      required this.onPressed});

  final double percentage;
  final String base64Image;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.width * percentage;
    Uint8List image = base64Decode(base64Image);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: MemoryImage(image),
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
      ),
      child: ElevatedButton(
        child: null,
        onPressed: () => onPressed(),
      ),
    );
  }
}
