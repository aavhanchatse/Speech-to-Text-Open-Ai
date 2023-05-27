import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:openaispeech/app_constants/constants.dart';
import 'package:openaispeech/utils/custom_exceptions.dart';
import 'package:retry/retry.dart';

class API<T> {
  Future<http.Response> postMethod(String endpoint, Map payLoad,
      [Map<String, String>? headers = const {
        'Content-Type': 'application/json'
      }]) async {
    debugPrint(
        '${ApiPath.baseURL + endpoint}  + payload = ${jsonEncode(payLoad)}');

    var response = await http.post(
      Uri.parse(ApiPath.baseURL + endpoint),
      body: jsonEncode(payLoad),
      headers: headers,
    );

    return _handledResponse(response, endpoint);
  }

  Future<http.Response> deleteMethod(String endpoint,
      [Map<String, String>? headers = const {}]) async {
    debugPrint('${ApiPath.baseURL + endpoint}');

    final response = await http.delete(Uri.parse(ApiPath.baseURL + endpoint));
    return _handledResponse(response, endpoint);
  }

  Future<http.Response> getMethod(
    String endpoint, [
    Map<String, String>? headers = const {},
    String parameterString = "",
  ]) async {
    debugPrint(
        '${ApiPath.baseURL + endpoint}${parameterString.isNotEmpty ? "?" : ""}$parameterString');
    final response = await retry(
      () async => await http.get(
          Uri.parse(
              "${ApiPath.baseURL}$endpoint${parameterString.isNotEmpty ? "?" : ""}$parameterString"),
          headers: headers),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return _handledResponse(response, endpoint);
  }

  Future<http.Response> getMethodCustom(
    String endpoint, [
    Map<String, String>? headers = const {},
    String parameterString = "",
  ]) async {
    debugPrint(
        '${endpoint}${parameterString.isNotEmpty ? "?" : ""}$parameterString');
    final response = await retry(
      () async => await http
          .get(
              Uri.parse(
                  "${ApiPath.baseURL}$endpoint${parameterString.isNotEmpty ? "?" : ""}$parameterString"),
              headers: headers)
          .timeout(Duration(seconds: 5)),
      retryIf: (e) => e is SocketException || e is TimeoutException,
    );
    return _handledResponse(response, endpoint);
  }

  Future<http.Response> _handledResponse(
      http.Response response, String endpoint) async {
    debugPrint('status code: ${response.statusCode}');
    debugPrint('response[$endpoint]: ${response.body}');

    // if (response.body!['auth'] == false) {
    //   LogoutDialog().logout();
    //   return null;
    // }

    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.toString());
      case 500:
      default:
        throw FetchDataException(
            "Error occurred while communicating with server with StatusCode : ${response.statusCode}");
    }
  }
}
