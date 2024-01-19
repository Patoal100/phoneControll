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

  Future<void> connectToWebSocket(url) async {
    _channel = await IOWebSocketChannel.connect(url);
    var data = {
      'motion': '',
      'isCorrect': null,
      'message': 'phone',
    };
    sendMessage(data);
    _channel.stream.listen((message) {
      // Maneja los mensajes entrantes aquí
      onMessageReceived(message);
    });
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
