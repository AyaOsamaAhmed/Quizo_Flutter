

import 'package:dartz/dartz.dart';

import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../models/user_model.dart';
import '../../../utilities/api_end_point.dart';

class LoginDataHandeler {


  static Future<Either<Failure,UserModel>> login({required String phone})async {
    try {
      UserModel response = await GenericRequest<UserModel>(
        method: RequestApi.postJson(
            url: APIEndPoint.login,
            bodyJson  : {
              "phoneNumber": phone,
              "otp": "",
              "deviceId" : ""
            }
        ),
        fromMap: (res) => UserModel.fromJson(res["user"])..token = res["token"],
      ).getObject();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }


}