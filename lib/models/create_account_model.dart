



import 'dart:ffi';

class CreateAccountModel {
  final String? data;
  final String? message;
  final Bool? status;

  CreateAccountModel({
    this.data ,
    this.message,
     this.status
  });

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) =>
      CreateAccountModel(
      //  data: json["data"],
        message: json["message"],
      //  status: json["status"],
      );

  Map<String, dynamic> toJson() =>
      {
        "data": data,
        "message": message,
        "status": status,
      };
}



