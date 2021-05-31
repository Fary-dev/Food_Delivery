import 'package:flutter/material.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/google_Maps/map_screen.dart';
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

  containerSortirung() {
    int select;
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
              setState(() {
                select = index;
              });
            },
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: select == index ? colorIcon : colorBtn,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    iconn,
                    color: select == index ? colorBtn : colorIcon,
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
      });
    }
//______________________showModalBottomSheet_____Sortierung_____________________

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.grey[50],
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
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        btnSort(Icons.star, 'Qualität', 0, primaryColor,
                            greyLightColor),
                        SizedBox(
                          height: 10,
                        ),
                        btnSort(Icons.local_fire_department_rounded,
                            'Beliebtheit', 1, primaryColor, greyLightColor),
                        SizedBox(
                          height: 10,
                        ),
                        btnSort(Icons.timer, 'Zeit', 2, primaryColor,
                            greyLightColor),
                        SizedBox(
                          height: 10,
                        ),
                        btnSort(Icons.location_pin, 'Entfernung', 3,
                            primaryColor, greyLightColor),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        elevation: 10,
                        color: Colors.white,
                        child: Text(
                          'ÜBERNEHMEN',
                          style: TextStyle(color: Colors.redAccent[400]),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              height: 350,
            );
          },
        );
      },
    );
  }

//______________________showModalBottomSheet_____Filter_________________________

  containerFilter(context) {
    Widget buttomFilter(String btnName, Color colorTxt, Color colorBtn,
        int index, bool isActive) {
      Color colorBtn = greyLightColor;
      return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
        // ignore: deprecated_member_use
        return MaterialButton(
          onPressed: () {
            setState(() {
              colorBtn == greyLightColor
                  ? colorBtn = primaryColor
                  : colorBtn = greyLightColor;
              colorTxt == blackColor
                  ? colorTxt = whiteColor
                  : colorTxt = blackColor;
            });
          },
          shape: StadiumBorder(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 13.0),
            child: Text(
              btnName,
              style: TextStyle(fontSize: 14, color: colorTxt),
            ),
          ),
          color: colorBtn,
        );
      });
    }

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              color: Colors.grey[50],
              height: MediaQuery.of(context).size.height / 2.4,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: whiteColor,
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
                                Navigator.pop(context);
                              })
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 37,
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
                          buttomFilter(
                              'bis 10\€', blackColor, greyLightColor, 0, false),
                          SizedBox(
                            width: 15,
                          ),
                          buttomFilter(
                              'bis 15\€', blackColor, greyLightColor, 1, false),
                          SizedBox(
                            width: 15,
                          ),
                          buttomFilter(
                              'Egal', blackColor, greyLightColor, 2, false)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            setState(() {});
                          },
                          child: Text(
                            'Zurücksetzen',
                            style: TextStyle(color: greyColor),
                          )),
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 65,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        elevation: 10,
                        color: whiteColor,
                        child: Text(
                          'ZEIGE 3 RESTURANTS',
                          style: TextStyle(color: primaryColor),
                        ),
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
