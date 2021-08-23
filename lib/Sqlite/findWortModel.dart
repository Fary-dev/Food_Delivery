import 'package:get/get.dart';

class SearchWord {
  int? id;
  String? word;

  SearchWord({
    this.id,
    this.word,
  });

  factory SearchWord.fromMap(Map<String, dynamic> json) => SearchWord(
        id: json['id'],
        word: json['word'],
      );

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id1'] = id;
    }
    map['word'] = word;
    return map;
  }
}

class SearchingController extends GetxController {
  RxList<String> historyList = <String>[].obs;
  RxList<SearchWord> searchListWord = <SearchWord>[].obs;
}
