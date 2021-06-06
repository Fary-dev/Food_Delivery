import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Home_Page/HomePage.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Resturant_List_Controller.dart';
import 'package:mjam/Screens/google_Maps/map_screen.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';
import 'package:mjam/models_and_data/Icons/font1.dart';

class BottomFilterAbholungSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //__________________________Sortierung______________________________
          ElevatedButton.icon(
            onPressed: () {
              containerSortirung(context);
            },
            icon: Icon(
              Icons.sort,
              color: primaryColor,
            ),
            label: Text(
              'Sortierung',
              style: Theme.of(context)
                  .primaryTextTheme
                  .button
                  .apply(fontSizeDelta: -3),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(whiteColor)),
          ),

          //____________________________Filter________________________________
          ElevatedButton.icon(
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
                  .button
                  .apply(fontSizeDelta: -3),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(whiteColor)),
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
                  .button
                  .apply(fontSizeDelta: -3),
            ),
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all(whiteColor)),
          ),
        ],
      ),
    );
  }
}

void containerSortirung(context) {
  final ResturantListController sortList = Get.put(ResturantListController());

  var selectSortItem = ''.obs;
  Widget btnSort(IconData iconn, String txt, Color colorIcon, Color colorBtn) {
    Color colorIcon = primaryColor;
    Color colorBtn = greyLightColor;
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: GestureDetector(
            onTap: () {
              selectSortItem.value = txt;
            },
            child: Row(
              children: [
                Obx(
                  () => Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: selectSortItem.value == txt ? colorIcon : colorBtn,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      iconn,
                      color: selectSortItem.value == txt ? colorBtn : colorIcon,
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  txt,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.grey[50],
              ),
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
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
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.5),
                          ),
                          Spacer(),
                          IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                Get.back();
                                selectSortItem.value = '';
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        btnSort(Icons.star, 'Qualität', primaryColor,
                            greyLightColor),
                        SizedBox(
                          height: 10,
                        ),
                        btnSort(Icons.local_fire_department_rounded,
                            'Beliebtheit', primaryColor, greyLightColor),
                        SizedBox(
                          height: 10,
                        ),
                        btnSort(
                            Icons.timer, 'Zeit', primaryColor, greyLightColor),
                        SizedBox(
                          height: 10,
                        ),
                        btnSort(Icons.location_pin, 'Entfernung', primaryColor,
                            greyLightColor),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      child: Obx(
                        () => MaterialButton(
                          elevation: 10,
                          color: selectSortItem.value == ''
                              ? whiteColor
                              : primaryColor,
                          child: Obx(() => Text(
                                'ÜBERNEHMEN',
                                style: TextStyle(
                                    color: selectSortItem.value == ''
                                        ? primaryColor
                                        : whiteColor),
                              )),
                          onPressed: () {
                            sortList.sort = selectSortItem;

                            if (selectSortItem.value == 'Qualität') {
                              sortList.list.value = resturants
                                ..sort((a, b) => b.ratingResturant
                                    .compareTo(a.ratingResturant));
                            } else if (selectSortItem.value == 'Zeit') {
                              sortList.list.value = resturants
                                ..sort((a, b) => a.deliveryDuration
                                    .compareTo(b.deliveryDuration));
                            } else if (selectSortItem.value == 'Enrfernung') {
                              sortList.list.value = resturants
                                ..sort((a, b) => a.deliveryDuration
                                    .compareTo(b.deliveryDuration));
                            } else if (selectSortItem.value == 'Beliebtheit') {
                              sortList.list.value = resturants
                                ..sort(
                                    (a, b) => b.distance.compareTo(a.distance));
                            } else {
                              sortList.list.value = resturants;
                            }

                            Get.back();

                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              height: 350,
            ),
          );
        },
      );
    },
  );
}

//______________________showModalBottomSheet_____Filter_________________________

void containerFilter(context) {
  final ResturantListController filterList = Get.put(ResturantListController());

  var selectFilterItem = ''.obs;
  var listItemCount = 0.obs;
  buttomFilter(String btnName, int index) {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Obx(
        () => MaterialButton(
          onPressed: () {
            selectFilterItem.value = btnName;

            filterList.sort.value = btnName;
            final sortList = resturants
              ..sort((a, b) =>
                  a.minimumOrder.compareTo(b.minimumOrder));
            if (selectFilterItem.value == 'Bis 10 \€') {
               filterList.list.value = sortList
                  .where(( a) =>
              (a.minimumOrder <=
                  10)).toList();

              listItemCount.value = filterList.list.length;
            } else if (selectFilterItem.value == 'Bis 20 \€') {
              filterList.list.value =  sortList
                  .where(( a) =>
              (a.minimumOrder <=
                  20)).toList();
              listItemCount.value = filterList.list.length;
            } else if (selectFilterItem.value == 'Egal') {
              filterList.list.value = sortList.where(( a) =>
              (a.minimumOrder>=0)
            ).toList();
              listItemCount.value = filterList.list.length;
            } else {
              filterList.sort.value = '';
              listItemCount.value = filterList.list.length;
            }
          },
          shape: StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: Text(
              btnName,
              style: TextStyle(
                fontSize: 14,
                color:
                    selectFilterItem.value == btnName ? whiteColor : blackColor,
              ),
            ),
          ),
          color:
              selectFilterItem.value == btnName ? primaryColor : greyLightColor,
        ),
      );
    });
  }

  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                color: Colors.grey[50],
              ),
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Filtern nach...',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          IconButton(
                              icon: Icon(Icons.cancel),
                              onPressed: () {
                                Get.back();
                                selectFilterItem.value = '';
                                listItemCount.value = 0;
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Mindestbestellwert',
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          buttomFilter('Bis 10 \€', 1),
                          SizedBox(
                            width: 15,
                          ),
                          buttomFilter('Bis 20 \€', 2),
                          SizedBox(
                            width: 15,
                          ),
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
                          selectFilterItem.value = '';
                          listItemCount.value = 0;
                        },
                        child: Obx(
                          () => Text(
                            'Zurücksetzen',
                            style: TextStyle(
                              color: selectFilterItem.value != ''
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      child: Obx(
                        ()=> MaterialButton(
                          elevation: 10,
                          color: selectFilterItem.value == ''
                              ? whiteColor
                              : primaryColor,
                          child: Obx(
                            () => Text(
                              'ZEIGE ${filterList.list.length} RESTURANTS',
                              style: TextStyle(
                                color: selectFilterItem.value == ''
                                    ? primaryColor
                                    : whiteColor,
                              ),
                            ),
                          ),
                          onPressed: () {
                            if(selectFilterItem.value!='')
                            Get.back();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
