import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketService extends GetxController {
  late IOWebSocketChannel _channel;
  late String _url;

  // Instancia privada estática
  static WebSocketService? _instance;

  // Constructor de fábrica
  factory WebSocketService() {
    return _instance ??= WebSocketService._internal();
  }

  // Constructor interno
  WebSocketService._internal();

  @override
  void onInit() {
    super.onInit();
    connectToWebSocket(_url);
  }

  Future<void> connectToWebSocket(url) async {
    _channel = await IOWebSocketChannel.connect(url);
    _channel.stream.listen((message) {
      // Maneja los mensajes entrantes aquí
      print(message);
    });
  }

  void sendMessage(String message) {
    if (_channel.sink != null) {
      _channel.sink.add(message);
    }
  }

  @override
  void onClose() {
    _channel.sink.close();
    super.onClose();
  }
}
