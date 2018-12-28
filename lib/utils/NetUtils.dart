import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_osc_clone/events/HttpErrorEvent.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_osc_clone/constants/Constants.dart' show Constants;

class NetUtils {
  static Future<ResultData> request(String url, RequestMethod method, params, {noTip = false}) async {

    /// 没有网络
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return ResultData(value: Code.errorHandle(Code.NETWORK_ERROR, '网络中断', noTip), isSuccess: false, code:Code.NETWORK_ERROR);
    }

    Dio dio = Dio();
    Response response;
    var options = Options(method: Constants.Methods[method.index], connectTimeout: 15000);
    try {
      response = await dio.request(url, data: params, options: options);
    } on DioError catch (e) {
      print('请求异常: ' + e.toString());
      print('请求异常url' + url);

      Response errorResp;
      if (e.response != null) {
        errorResp = e.response;
      }else {
        errorResp = Response(statusCode: 999);
      }
      
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResp.statusCode = Code.NETWORK_TIMEOUT;
      }

      return ResultData(value: Code.errorHandle(errorResp.statusCode, e.message, noTip), isSuccess: false, code: errorResp.statusCode);
    }

    return ResultData(value: response.data, isSuccess: true);
  }
}

class ResultData {
  var value;
  bool isSuccess;
  int code;
  
  ResultData({
    this.value,
    this.isSuccess,
    this.code
  });
}

class Code {
  static const NETWORK_ERROR = -1;
  static const NETWORK_TIMEOUT = -2;
  static const SUCCESS = 200;

  static final EventBus eventBus = EventBus();

  static errorHandle(code, msg, noTip) {
    if (noTip) {
      return msg;
    }else {
      eventBus.fire(HttpErrorEvent(code, msg));
    }
  }
}

enum RequestMethod {
   get, post
}