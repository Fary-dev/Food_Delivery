import 'package:get/state_manager.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class ResturantListController extends GetxController {
  RxList defaultListResturant=[].obs;
  var selectSortItem = ''.obs;
  var selectFilterItem = ''.obs;
  RxSet<String> categuryListSet=<String>{}.obs;
  final list = <Resturant>[].obs;
  final reserveList=<Resturant>[].obs;


}
