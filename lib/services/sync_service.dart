import 'dart:async';
import 'api_service.dart';

// singleton instance for sync service
final syncLocalData = SyncServiceSingleton();

class SyncServiceSingleton {
  static final SyncServiceSingleton _singleton =
      SyncServiceSingleton._internal();
  SyncServiceSingleton._internal();
  factory SyncServiceSingleton() {
    return _singleton;
  }
  final apiService = ApiService();

  Future<Map> imageBytes(
      String url, Map<String, dynamic> fileParameters) async {
    try {
      final response = await apiService
          .getData(url, null, fileParameters)
          .timeout(const Duration(seconds: 10));
      if (response != null && response is Map<String, dynamic>) {
        return response;
      } else {
        return {'error': true, 'message': 'No se puede obtener la información'};
      }
    } catch (e) {
      return {'error': true, 'message': 'Servicio no disponible'};
    }
  }

  Future<Map> jsonData(String url, Map<String, dynamic> fileParameters) async {
    try {
      final response = await apiService
          .postData(url, fileParameters, null)
          .timeout(const Duration(seconds: 10));
      if (response != null && response is Map<String, dynamic>) {
        return response;
      } else {
        return {'error': true, 'message': 'No se puede obtener la información'};
      }
    } catch (e) {
      return {'error': true, 'message': 'Servicio no disponible'};
    }
  }
}
