
import '../models/server_model.dart';

class APIEndPoint{

  APIEndPoint._();

  static final ServerModel _dotNetApiServer = ServerModel(serverIsSecured: false, host: "brainiacs.quizoo.mobi", apiPrefix: "api");

  static String get _dotNetBaseUrl => _dotNetApiServer.baseUrl;

  //=========================== api User ====================================

  static String get login => "$_dotNetBaseUrl/Users/Login";


  static Uri uri({required String path, Map<String, dynamic> queryParameters = const {}}) {
    return Uri.parse(path).replace(queryParameters: {...queryParameters,...Uri.parse(path).queryParameters});
  }
}



