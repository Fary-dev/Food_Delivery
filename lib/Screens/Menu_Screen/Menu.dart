import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/First_Page/First_Location_controller.dart';
import 'package:mjam/Screens/Resturants/Resturant_List/resturans_liste.dart';
import 'package:mjam/Widgets/Ctegury_Banner/listFoodGrupe.dart';
import 'package:mjam/home_Screen_Tile/Bottom_Filter_Abholung_sort.dart';
import '../Banner/Banr.dart';

class Menu extends StatelessWidget {
  final adress = Get.find<FirstPageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        brightness: Theme.of(context).appBarTheme.brightness,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            child: Obx(
              () => RichText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Sofort zu ",
                        style: Theme.of(context).primaryTextTheme.headline6),
                    TextSpan(
                      text: adress.fistUserLocation.value.toString(),
                      style: Theme.of(context)
                          .primaryTextTheme
                          .headline6!
                          .apply(color: primaryColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 6),
            FoodGrupe(),
            BottomFilterAbholungSort(),
            Banr(),
            ResturantListe(),
          ],
        ),
      ),
    );
  }
}
