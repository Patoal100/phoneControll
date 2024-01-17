import 'package:get/get.dart';

class ConfigurationController extends GetxController {
  // Aquí puedes definir tus variables y métodos para la configuración

  var configValue = ''.obs;
  var itemSize = 1.0.obs;
  var textSize = 20.0.obs;
  var menuButtonSize = 36.0.obs;

  void increaseSize() {
    if (textSize.value < 35.0) {
      // Límite superior para el tamaño
      itemSize.value += 0.1; // Cambia el valor según sea necesario
      textSize.value += 5.0; // Cambia el valor según sea necesario
      menuButtonSize.value += 5.0; // Cambia el valor según sea necesario
    }
  }

  void decreaseSize() {
    if (textSize.value > 10.0) {
      // Límite inferior para el tamaño
      itemSize.value -= 0.1; // Cambia el valor según sea necesario
      textSize.value -= 5.0; // Cambia el valor según sea necesario
      menuButtonSize.value -= 5.0; // Cambia el valor según sea necesario
    }
  }

  void updateConfig(String newValue) {
    configValue.value = newValue;
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   // Aquí puedes inicializar tus variables o llamar a métodos al iniciar el controlador
  // }

  @override
  void onClose() {
    // Aquí puedes limpiar los recursos antes de que el controlador sea destruido
    super.onClose();
  }
}
