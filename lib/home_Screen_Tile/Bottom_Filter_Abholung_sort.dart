import 'package:flutter/material.dart';
import 'package:mjam/models_and_data/Icons_Fonts/font1.dart';

class BottomFilterAbholungSort extends StatefulWidget {
  @override
  _BottomFilterAbholungSortState createState() =>
      _BottomFilterAbholungSortState();
}

class _BottomFilterAbholungSortState extends State<BottomFilterAbholungSort> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(bottom: 5),
        height: 50,
        color: Colors.grey[100],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            //__________________________Sortierung______________________________
            Container(
              // ignore: deprecated_member_use
              child: RaisedButton.icon(
                onPressed: () {
                  containerSortirung(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                label: Text(
                  'Sortierung',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5),
                ),
                icon: Icon(
                  Icons.sort,
                  color: Colors.red[700],
                ),
                textColor: Colors.black,
                color: Colors.white,
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
                      color: Colors.black87,
                      fontSize: 10,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600),
                ),
                icon: Icon(
                  Iconsss.equalizer,
                  size: 20,
                  color: Colors.red[700],
                ),
                textColor: Colors.black,
                color: Colors.white,
              ),
            ),
            //__________________________Abholung________________________________
            Container(
              // ignore: deprecated_member_use
              child: RaisedButton.icon(
                onPressed: () {
                  print('Button Clicked.');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                label: Text(
                  'Abholung',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 10,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600),
                ),
                icon: Icon(
                  Iconsss.walking,
                  size: 20,
                  color: Colors.red[700],
                ),
                textColor: Colors.black,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//______________________showModalBottomSheet_____Sortierung_____________________
void containerSortirung(context) {
  Widget btnSort(Icon iconn, String txt, int index) {
    Color colorIcon = Colors.redAccent[400];
    Color colorBtn = Colors.grey[200];
    int selectIndex;
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(0),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: colorBtn,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: iconn,
                color: colorIcon,
                onPressed: () {
                  colorBtn == Colors.grey[200]
                      ? colorBtn = Colors.redAccent[400]
                      : colorBtn = Colors.grey[200];
                  colorIcon == Colors.redAccent[400]
                      ? colorIcon = Colors.grey[200]
                      : colorIcon = Colors.redAccent[400];

                  setState(() {
                    selectIndex = index;
                    print(selectIndex);
                  });
                },
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
      );
    });
  }

  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
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
                      btnSort(Icon(Icons.star), 'Qualität', 0),
                      SizedBox(
                        height: 10,
                      ),
                      btnSort(Icon(Icons.local_fire_department_rounded),
                          'Beliebtheit', 1),
                      SizedBox(
                        height: 10,
                      ),
                      btnSort(Icon(Icons.timer), 'Zeit', 2),
                      SizedBox(
                        height: 10,
                      ),
                      btnSort(Icon(Icons.location_pin), 'Entfernung', 3),
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
        });
      });
}

//______________________showModalBottomSheet_____Filter_________________________

void containerFilter(context) {
  Widget buttomFilter(String btnName, Color colorTxt, Color colorBtn, int index,
      bool isActive) {
    Color colorBtn = Colors.grey[200];
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      // ignore: deprecated_member_use
      return RaisedButton(
        onPressed: () {
          setState(() {
            colorBtn == Colors.grey[200]
                ? colorBtn = Colors.redAccent[400]
                : colorBtn = Colors.grey[200];
            colorTxt == Colors.black
                ? colorTxt = Colors.white
                : colorTxt = Colors.black;
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
      builder: (BuildContext bc) {
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
                  SizedBox(
                    height: 10,
                  ),
                  Row(
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
                        buttomFilter('bis 10\€', Colors.black, Colors.grey[200],
                            0, false),
                        SizedBox(
                          width: 15,
                        ),
                        buttomFilter('bis 15\€', Colors.black, Colors.grey[200],
                            1, false),
                        SizedBox(
                          width: 15,
                        ),
                        buttomFilter(
                            'Egal', Colors.black, Colors.grey[200], 2, false)
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
                          style: TextStyle(color: Colors.grey[500]),
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
                      color: Colors.white,
                      child: Text(
                        'ZEIGE 3 RESTURANTS',
                        style: TextStyle(color: Colors.redAccent[400]),
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          );
        });
      });
}
