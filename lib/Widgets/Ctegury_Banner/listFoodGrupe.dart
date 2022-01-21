<<<<<<< HEAD
import 'package:flutter/material.dart';

class FoodGrupe extends StatefulWidget {
  final CateguryBanner categuryBanner;

  const FoodGrupe({Key key, this.categuryBanner}) : super(key: key);
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/Resturant_List_Controller.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class FoodGrupe extends StatefulWidget {
  final CateguryBanner? categuryBanner;

  const FoodGrupe({Key? key, this.categuryBanner}) : super(key: key);

>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
  @override
  _FoodGrupeState createState() => _FoodGrupeState();
}

class _FoodGrupeState extends State<FoodGrupe> {
<<<<<<< HEAD
=======
  final ResturantListController categuryFilter =
      Get.put(ResturantListController());
  RxBool indexCategury = false.obs;

>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).bannerTheme.backgroundColor,
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listCateguryBanner.length,
          itemBuilder: (context, index) {
            var categury = listCateguryBanner[index];

            return Padding(
              padding: const EdgeInsets.fromLTRB(15, 12, 15, 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, -1),
                            color: Theme.of(context)
                                .iconTheme
<<<<<<< HEAD
                                .color
=======
                                .color!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                                .withOpacity(0.5),
                            spreadRadius: 0.2,
                            blurRadius: 5),
                        BoxShadow(
                            offset: Offset(-1, 1),
                            color: Theme.of(context)
                                .iconTheme
<<<<<<< HEAD
                                .color
=======
                                .color!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                                .withOpacity(0.5),
                            spreadRadius: 0.2,
                            blurRadius: 5)
                      ],
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        categury.selected = !categury.selected;
<<<<<<< HEAD
=======
                        categuryFilter.selectFilterItem.value='';
                        categuryFilter.selectSortItem.value='';

                        if(categuryFilter.categuryListSet.isEmpty){
                          categuryFilter.list.clear();
                        }

                        if (categury.selected == true) {
                          if (categuryFilter.list.isNotEmpty) {
                            for (var res in resturants) {
                              for (var pro in res.products!) {
                                if (pro.nameProductType == categury.name) {
                                  if ((categuryFilter.categuryListSet
                                          .contains(categury.name)) ==
                                      false)
                                    categuryFilter.categuryListSet
                                        .add(categury.name);
                                  if ((categuryFilter.list.contains(res)) ==
                                      false) categuryFilter.list.add(res);
                                  if ((categuryFilter.reserveList.contains(res)) ==
                                      false) categuryFilter.reserveList.add(res);
                                }
                              }
                            }
                          } else {
                            for (var res in resturants) {
                              for (var pro in res.products!) {
                                if (pro.nameProductType == categury.name) {
                                  categuryFilter.categuryListSet
                                      .add(categury.name);
                                  categuryFilter.list.add(res);
                                  categuryFilter.reserveList.add(res);
                                }
                              }
                            }
                          }
                        } else {
                          categuryFilter.categuryListSet.remove(categury.name);
                          if (categuryFilter.categuryListSet.length >= 1) {
                            categuryFilter.list.clear();
                            categuryFilter.reserveList.clear();

                            for (int i = 0;
                                i < categuryFilter.categuryListSet.length;
                                i++) {
                              if (categuryFilter.list.isNotEmpty) {
                                for (var res in resturants) {
                                  for (var pro in res.products!) {
                                    if (pro.nameProductType ==
                                        categuryFilter.categuryListSet
                                            .elementAt(i)) {
                                      if (categuryFilter.list.contains(res) ==
                                          false)
                                        categuryFilter.list.add(res);

                                      if (categuryFilter.reserveList.contains(res) ==
                                          false)
                                        categuryFilter.reserveList.add(res);
                                    }
                                  }
                                }
                              } else {
                                for (var res in resturants) {
                                  for (var pro in res.products!) {
                                    if (pro.nameProductType ==
                                        categuryFilter.categuryListSet
                                            .elementAt(i)) {
                                      categuryFilter.list.add(res);
                                      categuryFilter.reserveList.add(res);
                                    }
                                  }
                                }
                              }
                            }
                          } else {
                            categuryFilter.categuryListSet.clear();
                            categuryFilter.list.clear();
                            categuryFilter.reserveList.clear();
                            categuryFilter.selectSortItem.value='';
                          }
                        }
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                        setState(() {});
                      },
                      color: Theme.of(context).primaryColor,
                      child: ColorFiltered(
                        child: Image.asset(
                          categury.photo,
                          fit: BoxFit.cover,
                        ),
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).bottomAppBarTheme.color ==
                                    Color(0xFF2A2929)
                                ? (categury.selected == false
                                    ? Color(0xFFFFFFFF)
                                    : categury.colorCategury)
                                : (categury.selected == false
                                    ? Colors.black
                                    : categury.colorCategury),
                            BlendMode.srcIn),
                      ),
                      shape: StadiumBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Text(
                      categury.name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .primaryTextTheme
<<<<<<< HEAD
                          .headline6
=======
                          .headline6!
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
                          .apply(fontSizeDelta: -3),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class CateguryBanner {
  String name;
  String photo;
  bool selected;
  Color colorCategury;
<<<<<<< HEAD
=======

>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
  CateguryBanner(this.name, this.photo, this.selected, this.colorCategury);
}

final pizza =
    CateguryBanner('Pizza', "assets/pizza-slice.png", false, Color(0xFFFC186A));
final burger =
    CateguryBanner('Burger', "assets/ber1.png", false, Color(0xFF18B3FC));
<<<<<<< HEAD
final salat =
    CateguryBanner('Salat', "assets/sa1.png", false, Color(0xFF97B500));
final pasta =
    CateguryBanner('Pasta', "assets/sp1.png", false, Color(0xFFF08800));
final kebap =
    CateguryBanner('Kebap', "assets/ke1.png", false, Color(0xFF06716A));
=======
final salate =
    CateguryBanner('Salate', "assets/sa1.png", false, Color(0xFF97B500));
final pasta =
    CateguryBanner('Pasta', "assets/sp1.png", false, Color(0xFFF08800));
// final kebap =
//     CateguryBanner('Kebap', "assets/ke1.png", false, Color(0xFF06716A));
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
final mehr =
    CateguryBanner('Mehr', "assets/Mehr.png", false, Color(0xFFA7021C));

final List<CateguryBanner> listCateguryBanner = [
  pizza,
  burger,
<<<<<<< HEAD
  salat,
  pasta,
  kebap,
=======
  salate,
  pasta,
  // kebap,
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
  mehr,
];
