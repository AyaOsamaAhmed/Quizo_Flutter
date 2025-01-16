



import 'dart:ffi';

class DataModel {
  final String? data;
  final String? message;
  final Bool? status;

  DataModel({
    this.data ,
    this.message,
     this.status
  });

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      DataModel(
        data: json["data"],
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



