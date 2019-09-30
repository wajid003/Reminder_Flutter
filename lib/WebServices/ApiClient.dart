
import 'package:dio/dio.dart';

class ApiClient{
  static final String BASE_URL = "https://greenhills.care/api/app/";
  static final ApiClient _apiClient = ApiClient._internal();
  Dio _dio;

  ApiClient._internal();

  factory ApiClient() {
    return _apiClient;
  }


  void _init() {
    if (_dio == null) {
      _dio = Dio();
      _dio.options.baseUrl = BASE_URL;
      _dio.interceptors.add(LogInterceptor());
      /*_dio.interceptors.add(InterceptorsWrapper(
          onRequest:(Options options) {
          //  options.headers["Authorization"] = await SharedPrefManager.instance.getString(SharedPrefManager.Token);
            options.headers["Authorization"] = "eyJpdiI6IklJRjFSWVFGVlhcLzVYMUp6VUNxcXBBPT0iLCJ2YWx1ZSI6Img1d3VhOXBod2RjV1BQVlNhXC9jXC84dz09IiwibWFj";
            return options; //continue
          }
      ));*/
      //(dio.transformer as DefaultTransformer).jsonDecodeCallback = parseJson;
      /* _dio.interceptors.add(LogInterceptor(requestBody: true, requestHeader: true));
      _dio.options.connectTimeout=5000;
      _dio.options.receiveTimeout=5000;*/
      _dio.options.receiveTimeout = 10000;
    }
  }

  Dio getDio() {
    _init();
    return _dio;
  }
}