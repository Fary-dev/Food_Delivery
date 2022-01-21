import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:mjam/Screens/Resturants/PageResturant/NewScreen/pageResturant.dart';
import 'package:mjam/Sqlite/Database.dart';
import 'package:mjam/Sqlite/findWortModel.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class Searching extends StatefulWidget {
  @override
  _SearchingState createState() => _SearchingState();
}

class _SearchingState extends State<Searching> {
  final SearchingController searchingController =
      Get.put(SearchingController());
  FloatingSearchBarController? controller;

  static const historyLength = 5;
  List<String> searchHistory = [];
  List<String> filteredSearchHistory = [];
  RxString selectedTerm = ''.obs;

  List<Resturant> res = [];
  List<Resturant> searchList = [];
  List<Resturant> resturantsList = [];

  @override
  void initState() {
    for (var a in resturants) {
      res.add(a);
    }
    resturantsList = res;
    filteredSearchHistory = filterSearchDatabase(filter: '')!;
    controller = FloatingSearchBarController();
    _refreshData();
    super.initState();
  }

  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  List<String>? filterSearchDatabase({@required String? filter}) {
    if (filter != '' && filter!.isNotEmpty) {
      return searchingController.historyList
          .where((element) => element.startsWith(filter))
          .toList();
    } else {
      return searchingController.historyList.toList();
    }
  }

  _refreshData() async {
    final data = await DB.getDataSearch();
    searchingController.searchListWord.value = data;
    searchingController.historyList.clear();
    data.forEach((e) => searchingController.historyList.add(e.word!));
    setState(() {});
  }

  _addToWordList(String word) async {
    if (searchingController.searchListWord.length < historyLength) {
      SearchWord searchWord = SearchWord(
        word: word,
      );
      await DB.insertSearchWord(searchWord);
      searchWord.id = searchingController.searchListWord.isEmpty
          ? 0
          : searchingController
                  .searchListWord[searchingController.searchListWord.length - 1]
                  .id! +
              1;
      _refreshData();
    } else {
      var a = searchingController.searchListWord.first;
      _removeWortFromList(a.word!);
      SearchWord searchWord = SearchWord(
        word: word,
      );
      await DB.insertSearchWord(searchWord);
      searchWord.id = searchingController.searchListWord.isEmpty
          ? 0
          : searchingController
                  .searchListWord[searchingController.searchListWord.length - 1]
                  .id! +
              1;
      _refreshData();
    }

    filteredSearchHistory = filterSearchDatabase(filter: '')!;
  }

  _removeWortFromList(String word) async {
    final s = searchingController.searchListWord
        .firstWhere((element) => element.word == word);
    await DB.deleteSearchWord(s.id!);
    _refreshData();
    filteredSearchHistory = filterSearchDatabase(filter: '')!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            height: 65,
            width: MediaQuery.of(context).size.width,
          ),
          Obx(
            () => FloatingSearchBar(
              elevation: 0,
              automaticallyImplyBackButton: false,
              transition: CircularFloatingSearchBarTransition(),
              physics: BouncingScrollPhysics(),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              controller: controller,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: Text(selectedTerm.value == ''
                  ? 'finde dein Resturant..'
                  : selectedTerm.value),
              hint: 'finden...',
              actions: [
                selectedTerm.value != '' &&
                        selectedTerm.value != 'finde dein Resturant..'
                    ? FloatingSearchBarAction.icon(
                        icon: Icon(
                          CupertinoIcons.clear_circled_solid,
                          size: 20,
                        ),
                        onTap: () {
                          selectedTerm.value = '';
                          searchList.clear();
                        })
                    : FloatingSearchBarAction.searchToClear(
                        color: Colors.grey[500],
                        size: 26,
                      ),
              ],
              onQueryChanged: (text) {
                // searchList.isNotEmpty?searchList.clear():null;
                setState(() {
                  // filteredSearchHistory = filterSearchTerms(filter: text)!;
                  searchingController.historyList.value =
                      filterSearchDatabase(filter: text)!;
                });
              },
              onSubmitted: (text) {
                if (text.isNotEmpty) {
                  setState(() {
                    _addToWordList(text);
                  });
                  _onChange(text);
                  controller!.close();
                } else {
                  controller!.close();
                }
                selectedTerm.value = text;
              },
              body: Column(
                children: [
                  Container(
                    color: Theme.of(context).primaryColor,
                    height: 65,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Expanded(
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: searchList.length,
                      itemBuilder: (context, index) {
                        var listViewSearch = searchList[index];

                        return GestureDetector(
                          onTap: () {
                            Get.to(
                                () => PageResturant(resturant: listViewSearch));
                          },
                          child: Card(
                            color: Theme.of(context).cardColor,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listViewSearch.nameResturant!,
                                        style:
                                            Theme.of(context).textTheme.button,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        listViewSearch.description!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1!
                                            .copyWith(fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Container(
                                      height: 40,
                                      width: 80,
                                      child: Image.asset(
                                        listViewSearch.logoResturant!,
                                        fit: BoxFit.contain,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              builder: (BuildContext context, Animation<double> transition) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Material(
                    child: Builder(
                      builder: (context) => searchingController
                                  .historyList.isEmpty &&
                              controller!.query.isEmpty
                          ? Container(
                              height: 50,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text(
                                'Suchen ..',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ))
                          : searchingController.historyList.isEmpty
                              ? ListTile(
                                  title: Text(
                                      'Suchen nach "${controller!.query}"'),
                                  onTap: () {
                                    setState(() {
                                      _addToWordList(controller!.query);
                                    });
                                    controller!.close();
                                    _onChange(controller!.query);
                                    selectedTerm.value = controller!.query;
                                  },
                                )
                              : Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          'Letzte Suchen',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.grey.shade500),
                                        )),
                                    Obx(
                                      () => Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: searchingController
                                            .historyList.reversed
                                            .map((e) => ListTile(
                                                  title: Text(
                                                    e,
                                                    style:
                                                        TextStyle(fontSize: 16),
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  trailing: IconButton(
                                                    icon: Icon(
                                                      CupertinoIcons.clear,
                                                      size: 20,
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        _removeWortFromList(e);
                                                      });
                                                    },
                                                  ),
                                                  onTap: () {
                                                    selectedTerm.value = e;
                                                    _onChange(e);
                                                    controller!.close();
                                                  },
                                                ))
                                            .toList(),
                                      ),
                                    ),
                                  ],
                                ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _onChange(text) {
    searchList.clear();
    setState(
      () {
        res.forEach((e) =>
            e.nameResturant!.toLowerCase().contains(text.toLowerCase()) == true
                ? setState(() {
                    searchList.add(e);
                  })
                : null);
      },
    );
  }
}
