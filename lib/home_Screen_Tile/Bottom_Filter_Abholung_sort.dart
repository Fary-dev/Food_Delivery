import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Resturant_List_Controller.dart';
import 'package:mjam/Screens/google_Maps/map_screen.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:mjam/models_and_data/Icons/font1.dart';

class BottomFilterAbholungSort extends StatelessWidget {
  final ResturantListController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //__________________________Sortierung______________________________
          Obx(
            () => ElevatedButton.icon(
              onPressed: () {
                containerSortirung(context);
              },
              icon: Icon(
                CupertinoIcons.sort_down,
                color: primaryColor,
              ),
              label: Text(
                'Sortierung',
                style: Theme.of(context)
                    .primaryTextTheme
                    .button!
                    .apply(fontSizeDelta: -3),
              ),
              style: _controller.selectSortItem.value != ''
                  ? ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: primaryColor, width: 1),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).bottomAppBarTheme.color),
                    )
                  : ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).bottomAppBarTheme.color),
                    ),
            ),
          ),

          //____________________________Filter________________________________
          Obx(
            () => ElevatedButton.icon(
              onPressed: () {
                containerFilter(context);
              },
              icon: Icon(
                Iconsss.equalizer,
                size: 20,
                color: primaryColor,
              ),
              label: Text(
                'Filter',
                style: Theme.of(context)
                    .primaryTextTheme
                    .button!
                    .apply(fontSizeDelta: -3),
              ),
              style: _controller.selectFilterItem.value != ''
                  ? ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: primaryColor, width: 1),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).bottomAppBarTheme.color),
                    )
                  : ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).bottomAppBarTheme.color),
                    ),
            ),
          ),

          //__________________________Abholung________________________________
          ElevatedButton.icon(
            onPressed: () {
              Get.to(() => MapScreen());
            },
            icon: Icon(
              Iconsss.walking,
              size: 20,
              color: primaryColor,
            ),
            label: Text(
              'Abholung',
              style: Theme.of(context)
                  .primaryTextTheme
                  .button!
                  .apply(fontSizeDelta: -3),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(
                    Theme.of(context).bottomAppBarTheme.color)),
          ),
        ],
      ),
    );
  }
}

void containerSortirung(context) {
  final ResturantListController sortList = Get.put(ResturantListController());

  Widget btnSort(IconData iconn, String txt, Color colorIcon, Color colorBtn) {
    Color colorIcon = primaryColor;
    Color colorBtn = greyLightColor;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GestureDetector(
            onTap: () {
              sortList.selectSortItem.value = txt;
              if (sortList.list.isEmpty) {
                if (sortList.selectSortItem.value == 'Qualität') {
                  sortList.defaultListResturant
                    ..sort((a, b) =>
                        b.ratingResturant.compareTo(a.ratingResturant));
                } else if (sortList.selectSortItem.value == 'Zeit') {
                  sortList.defaultListResturant
                    ..sort((a, b) =>
                        a.deliveryDuration.compareTo(b.deliveryDuration));
                } else if (sortList.selectSortItem.value == 'Entfernung') {
                  sortList.defaultListResturant
                    ..sort((a, b) => a.distance.compareTo(b.distance));
                } else if (sortList.selectSortItem.value == 'Beliebtheit') {
                  sortList.defaultListResturant
                    ..sort((a, b) => b.distance.compareTo(a.distance));
                }
              } else {
                if (sortList.selectSortItem.value == 'Qualität') {
                  sortList.list
                    ..sort((a, b) =>
                        b.ratingResturant!.compareTo(a.ratingResturant!));
                } else if (sortList.selectSortItem.value == 'Zeit') {
                  sortList.list
                    ..sort((a, b) =>
                        a.deliveryDuration!.compareTo(b.deliveryDuration!));
                } else if (sortList.selectSortItem.value == 'Entfernung') {
                  sortList.list
                    ..sort((a, b) => a.distance!.compareTo(b.distance!));
                } else if (sortList.selectSortItem.value == 'Beliebtheit') {
                  sortList.list
                    ..sort((a, b) => b.distance!.compareTo(a.distance!));
                }
              }
            },
            child: Row(
              children: [
                Obx(
                  () => Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: sortList.selectSortItem.value == txt
                          ? colorIcon
                          : colorBtn,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      iconn,
                      color: sortList.selectSortItem.value == txt
                          ? colorBtn
                          : colorIcon,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  txt,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .button!
                      .copyWith(fontSize: 14),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      'Sortiren nach...',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .button!
                          .copyWith(fontSize: 14),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.clear_circled_solid,
                      ),
                      onPressed: () {
                        sortList.selectSortItem.value = '';
                        Get.back();
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  btnSort(CupertinoIcons.star_fill, 'Qualität', primaryColor,
                      greyLightColor),
                  SizedBox(
                    height: 10,
                  ),
                  btnSort(CupertinoIcons.flame_fill, 'Beliebtheit',
                      primaryColor, greyLightColor),
                  SizedBox(
                    height: 10,
                  ),
                  btnSort(CupertinoIcons.timer, 'Zeit', primaryColor,
                      greyLightColor),
                  SizedBox(
                    height: 10,
                  ),
                  btnSort(CupertinoIcons.location_solid, 'Entfernung',
                      primaryColor, greyLightColor),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Obx(
                  () => MaterialButton(
                    elevation: 10,
                    color: sortList.selectSortItem.value == ''
                        ? Theme.of(context).cardColor
                        : primaryColor,
                    child: Obx(() => Text(
                          'ÜBERNEHMEN',
                          style: TextStyle(
                              fontFamily: 'Open_Sans_Bold',
                              fontSize: 14,
                              color: sortList.selectSortItem.value == ''
                                  ? Theme.of(context).iconTheme.color
                                  : whiteColor),
                        )),
                    onPressed: () {
                      if (sortList.selectSortItem.value != '') Get.back();
                    },
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}

//______________________showModalBottomSheet_____Filter_________________________

void containerFilter(context) {
  final ResturantListController filterList = Get.put(ResturantListController());
  var listItemCount = 0.obs;
  buttomFilter(String btnName, int index) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Obx(
        () => MaterialButton(
          onPressed: () {
            filterList.selectFilterItem.value = btnName;

            if (filterList.categuryListSet.isEmpty) {
              final sortList = resturants
                ..sort((a, b) => a.minimumOrder!.compareTo(b.minimumOrder!));
              if (filterList.selectFilterItem.value == 'Bis 10 \€') {
                filterList.list.value =
                    sortList.where((a) => (a.minimumOrder! <= 10)).toList();

                listItemCount.value = filterList.list.length;
              } else if (filterList.selectFilterItem.value == 'Bis 20 \€') {
                filterList.list.value =
                    sortList.where((a) => (a.minimumOrder! <= 20)).toList();
                listItemCount.value = filterList.list.length;
              } else if (filterList.selectFilterItem.value == 'Egal') {
                filterList.list.value =
                    sortList.where((a) => (a.minimumOrder! >= 0)).toList();
                listItemCount.value = filterList.list.length;
              } else {
                filterList.selectSortItem.value = '';
                listItemCount.value = filterList.list.length;
              }
            } else {
              final sortList = filterList.reserveList
                ..sort((a, b) => a.minimumOrder!.compareTo(b.minimumOrder!));

              List<Resturant> _select = [];
              _select.addAll(sortList.toSet());

              if (filterList.selectFilterItem.value == 'Bis 10 \€') {
                filterList.list.value =
                    _select.where((a) => (a.minimumOrder! <= 10)).toList();
                listItemCount.value = filterList.list.length;
              } else if (filterList.selectFilterItem.value == 'Bis 20 \€') {
                filterList.list.value =
                    _select.where((a) => (a.minimumOrder! <= 20)).toList();
                listItemCount.value = filterList.list.length;
              } else if (filterList.selectFilterItem.value == 'Egal') {
                filterList.list.value =
                    _select.where((a) => (a.minimumOrder! >= 0)).toList();
                listItemCount.value = filterList.list.length;
              } else {
                // filterList.sort.value = '';
                listItemCount.value = filterList.list.length;
              }
            }
          },
          shape: StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: Text(
              btnName,
              style: TextStyle(
                fontSize: 14,
                color: filterList.selectFilterItem.value == btnName
                    ? whiteColor
                    : blackColor,
              ),
            ),
          ),
          color: filterList.selectFilterItem.value == btnName
              ? primaryColor
              : Theme.of(context).cardColor,
        ),
      );
    });
  }

  showModalBottomSheet(
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Filtern nach...',
                        style: Theme.of(context)
                            .primaryTextTheme
                            .button!
                            .copyWith(fontSize: 14)),
                    IconButton(
                        icon: Icon(CupertinoIcons.clear_circled_solid),
                        onPressed: () {
                          Get.back();
                          filterList.selectFilterItem.value = '';
                          listItemCount.value = 0;
                        })
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'Mindestbestellwert',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .button!
                      .copyWith(fontSize: 14),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttomFilter('Bis 10 \€', 1),
                    buttomFilter('Bis 20 \€', 2),
                    buttomFilter('Egal', 3)
                  ],
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    filterList.selectFilterItem.value = '';
                    listItemCount.value = 0;
                  },
                  child: Obx(
                    () => Text(
                      'Zurücksetzen',
                      style: TextStyle(
                        color: filterList.selectFilterItem.value != ''
                            ? primaryColor
                            : greyColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 23,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Obx(
                  () => MaterialButton(
                    elevation: 10,
                    color: filterList.selectFilterItem.value == ''
                        ? Theme.of(context).cardColor
                        : primaryColor,
                    child: Obx(
                      () => Text(
                        'ZEIGE ${filterList.list.length} RESTURANTS',
                        style: TextStyle(
                          fontFamily: 'Open_Sans_Bold',
                          fontSize: 14,
                          color: filterList.selectFilterItem.value == ''
                              ? Theme.of(context).iconTheme.color
                              : whiteColor,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (filterList.selectFilterItem.value != '') Get.back();
                    },
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
