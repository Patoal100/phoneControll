import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService extends GetxController {
  late IOWebSocketChannel _channel;
  // Instancia privada estática
  static WebSocketService? _instance;

  // Constructor de fábrica
  factory WebSocketService() {
    return _instance ??= WebSocketService._internal();
  }

  // Constructor interno
  WebSocketService._internal();

  Future<bool> connectToWebSocket(url) async {
    try {
      _channel = IOWebSocketChannel.connect(url);
      await _channel.ready;
      _channel.stream.listen((message) {
        // Maneja los mensajes entrantes aquí
        onMessageReceived(message);
      });

      // Si la conexión fue exitosa, devuelve true
      return true;
    } catch (e) {
      // Si hubo un error, devuelve false
      return false;
    }
  }

  void sendMessage(var message) {
    _channel.sink.add(jsonEncode(message));
  }

  Future<void> onMessageReceived(String message) async {
    var decodedMessage = jsonDecode(message);
    print('Decoded message: $decodedMessage');
  }

  @override
  void onClose() {
    _channel.sink.close();
    super.onClose();
  }
}
