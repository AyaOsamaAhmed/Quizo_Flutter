

class UserModel {
  final int? commonUserId;
  final int? groupId;
  final String? _firstName;
  final String? _lastName;
  final String? primaryEmail;
  bool isPrimaryEmailVerified;
  String? phoneNumber;
  final bool isPhoneNumberVerified;
  final DateTime? birthDate;
  final DateTime? lastActiveAt;
  final int? gender;
  final String? vibes;
  final String? photoUrl;
  final String? recoveryEmail;
  final bool isRecoveryEmailVerified;
  final bool? isChatGroup;
  final int? roleId;
  final String? roleName;
  final String? lastLocationInMeter;
  final bool isSuspended;
  final double? lastLongitude;
  final double? lastLatitude;
  final String? groupName;
  final DateTime? suspendedDate;
  final String? userKey;
  final bool isActive;
   bool isSelected;
   bool isUserFollow;

   final DateTime? createdAt;
   String? token;
   int following;
   int followers;
   final int? totalExperiencePoints;
   final CommonUserInterests? commonUserInterests;

//  String get name => isSuspended? Strings.deletedUser.tr: "${_firstName??""} ${_lastName??""}";
  String get fName => _firstName??"";
  String get lName => _lastName??"";


  bool get hasLocation => lastLatitude != null && lastLongitude != null;

  UserModel({
    this.commonUserId,
    this.isUserFollow=false,
    this.isChatGroup=false,
    this.groupName,
    this.groupId,
    this.lastLocationInMeter,
    String? firstName,
    String? lastName,
    this.primaryEmail,
    this.isPrimaryEmailVerified = false,
    this.phoneNumber,
    this.isPhoneNumberVerified = false,
    this.birthDate,
    this.lastActiveAt,
    this.gender,
    this.vibes,
    this.photoUrl,
    this.recoveryEmail,
    this.isRecoveryEmailVerified = false,
    this.roleId,
    this.roleName,
    this.isSuspended = false,
    this.suspendedDate,
    this.isActive = false,
    this.createdAt,
    this.token,
    this.following = 0,
    this.followers=0,
    this.totalExperiencePoints,
    this.commonUserInterests,
    this.isSelected=false,
    this.userKey,
    this.lastLatitude,
    this.lastLongitude
  }): _firstName = firstName,_lastName = lastName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    following: json["following"] ?? 0,
    isUserFollow: json["isUserFollow"]??false,
    followers: json["followers"] ?? 0,
    totalExperiencePoints: json["totalExperiencePoints"],
    commonUserInterests: json["commonUserInterests"] == null ? null : CommonUserInterests.fromJson(json["commonUserInterests"]),
    token: json["token"],
    lastLocationInMeter: json["lastLocationInMeter"].toString(),
    commonUserId: json["commonUserId"],
    isChatGroup: json["isGroupChat"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    primaryEmail: json["primaryEmail"],
    isPrimaryEmailVerified: json["isPrimaryEmailVerified"]?? false,
    phoneNumber: json["phoneNumber"],
    isPhoneNumberVerified: json["isPhoneNumberVerified"]?? false,
    birthDate: json["birthDate"] == null ? null : DateTime.parse(json["birthDate"]),
    lastActiveAt: json["lastActiveAt"] == null ? null : DateTime.parse(json["lastActiveAt"]),
    gender: json["gender"],
    vibes: json["vibes"],
    photoUrl: json["photoUrl"],
    recoveryEmail: json["recoveryEmail"],
    isRecoveryEmailVerified: json["isRecoveryEmailVerified"]?? false,
    roleId: json["roleId"],
    groupName: json["groupName"],
    roleName: json["roleName"],
    userKey: json["userKey"]?.toString(),
    isSuspended: json["isSuspended"]?? false,
    suspendedDate: json["suspendedDate"] == null ? null : DateTime.parse(json["suspendedDate"]),
    isActive: json["isActive"]?? false,
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    lastLongitude: double.tryParse(json["longitude"]?.toString()??"")??0,
    lastLatitude: double.tryParse(json["latitude"]?.toString()??"")??0,
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "commonUserId": commonUserId,
    "lastLocationInMeter": lastLocationInMeter,
    "isUserFollow": isUserFollow,
    "isGroupChat": isChatGroup,
    "groupName": groupName,
    "firstName": _firstName,
    "lastName": _lastName,
    "userKey": userKey,
    "primaryEmail": primaryEmail,
    "isPrimaryEmailVerified": isPrimaryEmailVerified,
    "phoneNumber": phoneNumber,
    "isPhoneNumberVerified": isPhoneNumberVerified,
    "birthDate": birthDate?.toIso8601String(),
    "lastActiveAt": lastActiveAt?.toIso8601String(),
    "gender": gender,
    "vibes": vibes,
    "photoUrl": photoUrl,
    "recoveryEmail": recoveryEmail,
    "isRecoveryEmailVerified": isRecoveryEmailVerified,
    "roleId": roleId,
    "roleName": roleName,
    "isSuspended": isSuspended,
    "suspendedDate": suspendedDate?.toIso8601String(),
    "isActive": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "lastLatitude": lastLatitude,
    "lastLongitude": lastLongitude,
  };
  Map<String, String> toUpdateProfileMap() {

    Map<String, String> body = {
      "firstName": _firstName??"",
      "lastName": _lastName??"",
      "primaryEmail": primaryEmail??"",
      "birthDate": birthDate.toString(),
      "gender": gender.toString(),
      "vibes": vibes.toString(),
      "photoUrl": photoUrl.toString(),
    };

    return body;
  }

}
class CommonUserInterests {
  final int? commonUserId;
  final List<Category>? categories;

  CommonUserInterests({
    this.commonUserId,
    this.categories,
  });

  factory CommonUserInterests.fromJson(Map<String, dynamic> json) => CommonUserInterests(
    commonUserId: json["commonUserId"],
    categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "commonUserId": commonUserId,
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
  };
}
class Category {
  final int? id;
  final String? nameAr;
  final String? nameEn;
  final List<Category>? subCategories;

  Category({
    this.id,
    this.nameAr,
    this.nameEn,
    this.subCategories,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    nameAr: json["nameAR"],
    nameEn: json["nameEN"],
    subCategories: json["subCategories"] == null ? [] : List<Category>.from(json["subCategories"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nameAR": nameAr,
    "nameEN": nameEn,
    "subCategories": subCategories == null ? [] : List<dynamic>.from(subCategories!.map((x) => x.toJson())),
  };
}
