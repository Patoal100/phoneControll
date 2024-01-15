import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiService<T> {
  late final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<T> getData(String endPoint, Map<String, dynamic>? data,
      Map<String, dynamic>? queryParameters) async {
    try {
      var response = await _dio.get(
        endPoint,
        data: data,
        queryParameters: queryParameters,
      );

      debugPrint('response === $response');
      // logger.i('response.data = ${response.data}');
      // logger.i('response.headers =  ${response.headers}');
      // logger.i('response.requestOptions = ${response.requestOptions} ');
      // logger.i('response.statusCode = ${response.statusCode}');

      if (response.statusCode == 200) {
        // debugPrint('Respuesta: ${response.data}');
        return response.data as T;
      }
    } on DioException catch (e, s) {
      // logger.i('DIOError pruebita  $e');
      // logger.i('DIOTraza pruebita  $s');
      if (e.response!.statusCode == 500) {
        throw Exception("$e.response");
      }
    } catch (e, s) {
      // logger.i('Error pruebita  $e');
      // logger.i('Traza pruebita  $s');
      throw Exception("Error : $e");
    }
    // logger.i('llego hasta aqui');
    throw Exception("Error al conectar con el servidor");
  }

// TODO: Handle timeout on not working endpoints
  Future<T> postData(String endPoint, Map<String, dynamic> data,
      Map<String, dynamic>? queryParameters) async {
    try {
      var response = await _dio.post(endPoint,
          data: data, queryParameters: queryParameters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data is T) {
          return response.data as T;
        } else {
          return response.data;
        }
      } else {
        throw Exception('Failed to post data to API');
      }
    } on TimeoutException catch (e) {
      // logger.e('Error : $e');
      throw Exception("Error : $e");
    } on DioException catch (e) {
      if (e.response!.statusCode == 500) {
        // logger.e("Status 500 : $e.response");
        throw Exception("$e.response");
      }
    } catch (e) {
      // logger.e('Error : $e');
      throw Exception("Error : $e");
    }
    // logger.i('llego hasta aqui');
    throw Exception("Error en Inicio  de Sesión");
  }

  Future<T> putData(String endPoint, Map<String, dynamic> data) async {
    final response = await _dio.put(endPoint, data: data);
    if (response.statusCode == 200) {
      return json.decode(response.data);
    } else {
      throw Exception('Failed to put data to API');
    }
  }

  Future<T> deleteData(String endPoint) async {
    try {
      var response = await _dio.delete(endPoint);
      return json.decode(response.data);
      /*if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data is T) {
          return response.data as T;
        } else {
          return response.data;
        }
      } else {
        throw Exception('Failed to post data to API');
      }*/
    } on DioException catch (e, s) {
      // logger.i('DIOError pruebita  $e');
      // logger.i('DIOTraza pruebita  $s');
      if (e.response!.statusCode == 500) {
        throw Exception("$e.response");
      }
    } catch (e, s) {
      // logger.i('Error pruebita  $e');
      // logger.i('Traza pruebita  $s');
      throw Exception("Error : $e");
    }

    throw Exception('Failed to delete data from API');
  }
}
