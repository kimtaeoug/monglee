import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:get/get_connect/connect.dart';
import 'package:hive/hive.dart';
import 'package:monglee/app/services/mongle_service.dart';
import 'package:monglee/app/util/monglee_logger.dart';
import 'package:monglee/data/providers/local_request_representable.dart';

import 'api_request_representable.dart';

class Provider {
  static final _singleTon = Provider();

  static Provider get instance => _singleTon;

  Future requestLocal(LocalRequestRepresentable request) async {
    try {
      final storage = Get.find<MongleeService>();
      late Box box;
      if (request.localBox == LocalBox.todo) {
        box = storage.todoBox;
      } else {
        box = storage.diaryBox;
      }
      return LocalDBProcess(
        box: box,
        localMethod: request.localMethod,
        key: request.key,
        value: request.value,
      ).process();
    } catch (e) {
      logger.e(e);
    }
  }

  static const requestTime = Duration(seconds: 30);
  final GetConnect _client = GetConnect(
    timeout: requestTime,
    maxRedirects: 10,
  );

  Future requestServer(APIRequestRepresentable request) async {
    try {
      final response = await _client.request(
        request.url,
        request.method.string,
        query: request.query,
      );
      return _returnResponse(response);
    } catch (e) {
      logger.e(e);
    }
  }

  dynamic _returnResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 200:
        return response.body;
      // case 400:
      //   throw BadRequestException(response.body.toString());
      // case 401:
      // case 403:
      //   throw UnauthorisedException(response.body.toString());
      // case 404:
      //   throw BadRequestException('Not found');
      case 500:
        throw FetchDataException('Internal Server Error');
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode} ${response.statusText} ${response.body} ${response.request}');
    }
  }
}

class AppException implements Exception {
  final code;
  final message;
  final details;

  AppException({this.code, this.message, this.details});

  String toString() {
    return "[$code]: $message \n $details";
  }
}

class TimeOutException extends AppException {
  TimeOutException(String? details)
      : super(
          code: "request-timeout",
          message: "Request TimeOut",
          details: details,
        );
}

class FetchDataException extends AppException {
  FetchDataException(String? details)
      : super(
          code: "fetch-data",
          message: "Error During Communication",
          details: details,
        );
}
