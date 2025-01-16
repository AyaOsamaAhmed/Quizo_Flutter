

import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../models/data_model.dart';
import '../../../models/user_model.dart';
import '../../../utilities/api_end_point.dart';

class VerifyOtpDataHandler {


  static Future<Either<Failure,DataModel>> sendPhoneOTP({required String code ,required String phoneNumber  })async {
    try {
      DataModel response = await GenericRequest<DataModel>(
        method: RequestApi.postJson(
            url: APIEndPoint.SendPhoneOTP,
            bodyJson  : {
              "countryCode": code,
              "phoneNumber": phoneNumber,
            }
        ),
        fromMap:(_)=> DataModel.fromJson(_),
      ).getResponse();
      return Right(response);
    } on ServerException catch (failure) {
      print("${failure.errorMessageModel}");
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }

  static Future<Either<Failure,UserModel>> login({required String phone , required String otp })async {
    try {
      UserModel response = await GenericRequest<UserModel>(
        method: RequestApi.postJson(
            url: APIEndPoint.login,
            bodyJson  : {
              "phoneNumber": phone,
              "otp": otp,
              "deviceId" : ""
            }
        ),
        fromMap: (res) => UserModel.fromJson(res["user"])..token = res["token"],
      ).getResponse();
      return Right(response);
    } on ServerException catch (failure) {
      print("${failure.errorMessageModel}");
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }


}