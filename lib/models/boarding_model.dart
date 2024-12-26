import '../generated/assets.dart';
import '../generated/strings.dart';

class BoardingModel {

  final String imageUrl;
  final String title;

  BoardingModel({
    required  this.imageUrl,
    required this.title
  });


   static List<BoardingModel> sliderList = [
    BoardingModel(imageUrl: Assets.boarding1, title: Strings.boarding1),
    BoardingModel(imageUrl: Assets.boarding2, title: Strings.boarding2),
    BoardingModel(imageUrl: Assets.boarding3, title: Strings.boarding3),
  ];


}