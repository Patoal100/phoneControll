// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputTextCode extends StatelessWidget {
  InputTextCode({
    super.key,
    required this.hintText,
    this.type = TextInputType.number,
    this.labelText,
    this.hasIcon = false,
    this.icon,
    this.isPassword = false,
    required this.ctrlValue,
    this.validatorFunction,
    this.focusNode,
    this.height,
  });

  final RxBool isVisible = true.obs;

  final String hintText;
  final String? labelText;
  final TextInputType type;
  final bool hasIcon;
  final IconData? icon;
  final bool isPassword;
  TextEditingController ctrlValue;
  Function? validatorFunction;
  final FocusNode? focusNode;
  final double? height;

  @override
  Widget build(BuildContext context) {
    if (hasIcon && icon == null) {
      //Get.snackbar('Error', 'hasIcon is true but icon is null');
      throw ArgumentError('hasIcon is true but icon is null');
    }
    if (isPassword && hasIcon == true) {
      throw ArgumentError(
          'isPassword is true, so hasIcon must be false and icon is not required');
    }

    double? parseHeight = (height != null) ? height : 50.0;
    return isPassword
        ? Obx(() => TextFormField(
              focusNode: focusNode,
              keyboardType: type,
              obscureText: isVisible.value,
              controller: ctrlValue,
              validator: validatorFunction as String? Function(String?)?,
              style: TextStyle(
                color: (Get.isDarkMode)
                    ? Get.theme.primaryColorLight
                    : Get.theme.primaryColor,
                fontSize: parseHeight! * 1.5,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: parseHeight),
                  filled: true,
                  fillColor: Get.theme.canvasColor,
                  prefixIcon: isPassword
                      ? IconButton(
                          onPressed: () => isVisible.toggle(),
                          icon: Icon(
                            isVisible.value
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.blue,
                          ),
                        )
                      : (hasIcon
                          ? Icon(
                              icon,
                            )
                          : null),
                  hintText: hintText,
                  labelText: labelText,
                  hintStyle: TextStyle(
                      color: Get.theme.disabledColor, fontSize: height! * 1.5),
                  labelStyle: TextStyle(
                      color: Get.theme.disabledColor, fontSize: height! * 1.5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
            ))
        : TextFormField(
            controller: ctrlValue,
            validator: validatorFunction as String? Function(String?)?,
            keyboardType: type,
            style: TextStyle(
              color: (Get.isDarkMode)
                  ? Get.theme.primaryColorLight
                  : Get.theme.primaryColor,
              fontSize: parseHeight! * 1.5,
            ),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: parseHeight),
                filled: true,
                fillColor: Get.theme.canvasColor,
                prefixIcon: hasIcon
                    ? Icon(
                        icon,
                        color: Colors.blue,
                      )
                    : null,
                hintText: hintText,
                labelText: labelText,
                hintStyle: TextStyle(
                    color: Get.theme.disabledColor, fontSize: height! * 1.5),
                labelStyle: TextStyle(
                    color: Get.theme.disabledColor, fontSize: height! * 1.5),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25))),
          );
  }
}
