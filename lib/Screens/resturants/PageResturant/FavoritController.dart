import 'package:get/get.dart';
import 'package:mjam/Sqlite/FavoriteModel.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class FavoriteController extends GetxController {
  RxList<Resturant> userFavoriteList=<Resturant>[].obs;
  RxList<FavoriteModel> favoriteList = <FavoriteModel>[].obs;
}
