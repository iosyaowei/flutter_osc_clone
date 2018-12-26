import 'package:dio/dio.dart';
class NetUtils {
  static Future<ResultData> request(url, params) async {
    Dio dio = Dio();
    Response response;
    var options = Options(method: 'get');
    try {
      response = await dio.request(url, data: params, options: options);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = Response(statusCode: 999);
      }

      print('请求异常: ' + e.toString());
      print('请求异常url' + url);
    }

    print(response.toString());

    if (response.statusCode == 200 ) {
      
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
  static const NETWORK_TIME = -2;
  static const SUCCESS = 200;

}