
import '../models/server_model.dart';

class APIEndPoint{

  APIEndPoint._();

  static final ServerModel _dotNetApiServer = ServerModel(serverIsSecured: false, host: "brainiacs.quizoo.mobi", apiPrefix: "api");

  static String get _dotNetBaseUrl => _dotNetApiServer.baseUrl;

  //=========================== api User ====================================

  static String get login => "$_dotNetBaseUrl/Users/Login";
  static String get Register => "$_dotNetBaseUrl/Users/Register";
  static String get ChangePhoneNumber => "$_dotNetBaseUrl/Users/ChangePhoneNumber";
  static String get RefreshToken => "$_dotNetBaseUrl/Users/RefreshToken";
  static String get SendPhoneOTP => "$_dotNetBaseUrl/Users/SendPhoneOTP";
  static String get SendEmailOtp => "$_dotNetBaseUrl/Users/SendEmailOtp";
  static String get VerifyEmailOtp => "$_dotNetBaseUrl/Users/VerifyEmailOtp";
  static String get VerifyPhoneAndOtp => "$_dotNetBaseUrl/Users/VerifyPhoneAndOtp";
  static String get ResetPhoneNumber => "$_dotNetBaseUrl/Users/ResetPhoneNumber";


  static Uri uri({required String path, Map<String, dynamic> queryParameters = const {}}) {
    return Uri.parse(path).replace(queryParameters: {...queryParameters,...Uri.parse(path).queryParameters});
  }
}



