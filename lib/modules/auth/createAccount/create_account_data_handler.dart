

import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../../core/API/generic_request.dart';
import '../../../core/API/request_method.dart';
import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../../models/create_account_model.dart';
import '../../../models/user_model.dart';
import '../../../utilities/api_end_point.dart';

class CreateAccountDataHandler {


  static Future<Either<Failure,CreateAccountModel>> registration({required String firstName ,required String lastName
          ,required String email ,required String phoneNumber  })async {
    try {
      CreateAccountModel response = await GenericRequest<CreateAccountModel>(
        method: RequestApi.postJson(
            url: APIEndPoint.Register,
            bodyJson  : {
              "firstName": firstName,
              "lastName": lastName,
              "email": email,
              "countryCode": "20",
              "phoneNumber": "20$phoneNumber",
              "deviceId": "1"
            }
        ),
        fromMap:(_)=> CreateAccountModel.fromJson(_),
      ).getResponse();
      return Right(response);
    } on ServerException catch (failure) {
      print("${failure.errorMessageModel}");
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }


}