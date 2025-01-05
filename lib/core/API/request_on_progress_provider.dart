import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quizo_flutter/core/API/request_method.dart';

import '../error/exceptions.dart';
import '../error/failures.dart';
import 'generic_request.dart';

class RequestDataHandler{
  static Future<Either<Failure,dynamic>> executeRequestApi({required RequestApi requestApi})async{
    try {
      dynamic response = await GenericRequest<dynamic>(
        method: requestApi,
        fromMap: (_)=> _,
      ).getResponse();
      return Right(response);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel));
    }
  }
}

class RequestOnProgressProvider extends ChangeNotifier{
  int? bytes, totalBytes;

  void updateRequestOnProgress({required int? bytes,required int? totalBytes}){
    this.bytes = bytes;
    this.totalBytes = totalBytes;
    notifyListeners();
  }
}