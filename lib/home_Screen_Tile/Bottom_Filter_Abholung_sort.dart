import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/google_Maps/map_screen.dart';
import 'package:mjam/home_Screen_Tile/Sort_Controller.dart';
import 'package:mjam/models_and_data/Icons_Fonts/font1.dart';

class BottomFilterAbholungSort extends StatefulWidget {
  @override
  _BottomFilterAbholungSortState createState() =>
      _BottomFilterAbholungSortState();
}

class _BottomFilterAbholungSortState extends State<BottomFilterAbholungSort> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //__________________________Sortierung______________________________
          Container(
            // ignore: deprecated_member_use
            child: RaisedButton.icon(
              onPressed: () {
                containerSortirung();
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              label: Text(
                'Sortierung',
                style: TextStyle(
                    color: blackColor,
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5),
              ),
              icon: Icon(
                Icons.sort,
                color: primaryColor,
              ),
              textColor: blackColor,
              color: whiteColor,
            ),
          ),
          //____________________________Filter________________________________
          Container(
            // ignore: deprecated_member_use
            child: RaisedButton.icon(
              onPressed: () {
                containerFilter(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              label: Text(
                'Filter',
                style: TextStyle(
                    color: blackColor,
                    fontSize: 10,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600),
              ),
              icon: Icon(
                Iconsss.equalizer,
                size: 20,
                color: primaryColor,
              ),
              textColor: blackColor,
              color: whiteColor,
            ),
          ),
          //__________________________Abholung________________________________
          Container(
            // ignore: deprecated_member_use
            child: RaisedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MapScreen()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              label: Text(
                'Abholung',
                style: TextStyle(
                    color: blackColor,
                    fontSize: 10,
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w600),
              ),
              icon: Icon(
                Iconsss.walking,
                size: 20,
                color: primaryColor,
              ),
              textColor: blackColor,
              color: whiteColor,
            ),
          ),
        ],
      ),
    );
  }

  void containerSortirung() {
    final selecter = Get.put(SortController());
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // int select;
        Widget btnSort(IconData iconn, String txt, int index, Color colorIcon,
            Color colorBtn) {
          Color colorIcon = primaryColor;
          Color colorBtn = greyLightColor;

          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GestureDetector(
                  onTap: () {
                    selecter.selectSortItem.value = index;
                  },
                  child: Row(
                    children: [
                      Obx(
                        () => Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: selecter.selectSortItem.value == index
                                ? colorIcon
                                : colorBtn,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            iconn,
                            color: selecter.selectSortItem.value == index
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
                        style: TextStyle(fontSize: 14, color: Colors.black),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }

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
                                  Navigator.pop(context);
                                  selecter.selectSortItem.value = 0;
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          btnSort(Icons.star, 'Qualität', 1, primaryColor,
                              greyLightColor),
                          SizedBox(
                            height: 10,
                          ),
                          btnSort(Icons.local_fire_department_rounded,
                              'Beliebtheit', 2, primaryColor, greyLightColor),
                          SizedBox(
                            height: 10,
                          ),
                          btnSort(Icons.timer, 'Zeit', 3, primaryColor,
                              greyLightColor),
                          SizedBox(
                            height: 10,
                          ),
                          btnSort(Icons.location_pin, 'Entfernung', 4,
                              primaryColor, greyLightColor),
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
                            color: selecter.selectSortItem.value == 0
                                ? whiteColor
                                : primaryColor,
                            child: Obx(() => Text(
                                  'ÜBERNEHMEN',
                                  style: TextStyle(
                                      color: selecter.selectSortItem.value == 0
                                          ? primaryColor
                                          : whiteColor),
                                )),
                            onPressed: () {
                              setState(() {
                                print(selecter.selectSortItem.value);
                              });
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
    final selecter = Get.put(SortController());
    buttomFilter(String btnName, int index, bool isActive) {
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        return Obx(
          () => MaterialButton(
            onPressed: () {
              selecter.selectFilterItem.value = index;
            },
            shape: StadiumBorder(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13.0),
              child: Text(
                btnName,
                style: TextStyle(
                  fontSize: 14,
                  color: selecter.selectFilterItem.value == index
                      ? whiteColor
                      : blackColor,
                ),
              ),
            ),
            color: selecter.selectFilterItem.value == index
                ? primaryColor
                : greyLightColor,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
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
                                  Navigator.pop(context);
                                  selecter.selectFilterItem.value = 0;
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
                            buttomFilter('bis 10\€', 1, false),
                            SizedBox(
                              width: 15,
                            ),
                            buttomFilter('bis 15\€', 2, false),
                            SizedBox(
                              width: 15,
                            ),
                            buttomFilter('Egal', 3, false)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            selecter.selectFilterItem.value = 0;
                          },
                          child: Obx(
                            () => Text(
                              'Zurücksetzen',
                              style: TextStyle(
                                color: selecter.selectFilterItem.value != 0
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
                        // ignore: deprecated_member_use
                        child: Obx(
                          () => MaterialButton(
                            elevation: 10,
                            color: selecter.selectFilterItem.value == 0
                                ? whiteColor
                                : primaryColor,
                            child: Obx(
                              () => Text(
                                'ZEIGE 3 RESTURANTS',
                                style: TextStyle(
                                  color: selecter.selectFilterItem.value == 0
                                      ? primaryColor
                                      : whiteColor,
                                ),
                              ),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      )
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
}
