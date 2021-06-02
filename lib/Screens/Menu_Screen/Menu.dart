import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/First_Page/controller.dart';
import 'package:mjam/Widgets/listFoodGrupe.dart';
import 'package:mjam/home_Screen_Tile/Bottom_Filter_Abholung_sort.dart';
import '../Banner/Banr.dart';
import '../resturants/resturans_liste.dart';

class Menu extends StatelessWidget {
  final adress = Get.find<FirstPageController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                        style: TextStyle(
                          color: blackColor,
                          fontSize: 15,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: adress.defaltAdress.value.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
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
      ),
    );
  }
}
