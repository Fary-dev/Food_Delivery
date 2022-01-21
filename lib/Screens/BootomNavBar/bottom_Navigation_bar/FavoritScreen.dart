import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Login_and_SignUp/login_screen.dart';
import 'package:mjam/Screens/Login_and_SignUp/sign_up_screen.dart';
import 'package:mjam/Screens/Resturants/PageResturant/FavoritController.dart';
import 'package:mjam/Sqlite/Database.dart';
import 'package:mjam/Screens/Resturants/PageResturant/NewScreen/pageResturant.dart';
import 'package:mjam/Widgets/Rating.dart';
import 'package:mjam/models_and_data/Class/models_and_data.dart';

class FavoriteScreen extends StatefulWidget {
  FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final FavoriteController favoriteController = Get.put(FavoriteController());

  final userData = GetStorage();
  PageResturant? pageResturant;
  ScrollController? cs=ScrollController();
  RxDouble aa=0.0.obs;

  @override
  void initState() {
    _refreshData();
    cs!.addListener(() { aa.value=cs!.offset/cs!.position.maxScrollExtent<0?0:cs!.offset/cs!.position.maxScrollExtent>1?1:cs!.offset/cs!.position.maxScrollExtent;});
    super.initState();
  }

  void _refreshData() async {
    final data = await DB.getDataFavoriteList();
    List<Resturant> a = [];
    for (var i in data) {
      for (var x in resturants) {
        if (i.name == x.nameResturant && i.owner == x.owner) {
          a.add(x);
        }
      }
    }
    setState(() {
      favoriteController.userFavoriteList.value = a;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        title:   Opacity(opacity:/*aa.value*/1,
              child: Text(
                "Mein Foodo",
                style: Theme.of(context).primaryTextTheme.button,
              ),
          ),

      ),
      body: userData.read('isLogged') == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: ColorFiltered(
                    child: Image.asset(
                      "assets/shop.png",
                      fit: BoxFit.cover,
                    ),
                    colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Text(
                  'Es ist leer hier',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: greyColor),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Du musst angemeldet sein, um diese '
                  'Information sehen zu können',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: greyColor),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 100,
                ),
                MaterialButton(
                  minWidth: 340,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: primaryColor, width: 2.0),
                  ),
                  child: Text(
                    'KUNDENKONTO ERSTELLEN',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button!
                        .apply(color: primaryColor),
                  ),
                  onPressed: () {
                    Get.to(() => SignUpScreen());
                  },
                ),
                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 45, right: 15),
                          child: Divider(
                            color: greyColor,
                            height: 25,
                          ),
                        ),
                      ),
                      Text(
                        'oder',
                        style: TextStyle(fontSize: 11, color: greyColor),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 45),
                          child: Divider(
                            color: greyColor,
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  color: primaryColor,
                  minWidth: 340,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: primaryColor),
                  ),
                  child: Text(
                    'ANMELDEN',
                    style: Theme.of(context)
                        .primaryTextTheme
                        .button!
                        .apply(color: whiteColor),
                  ),
                  onPressed: () {
                    Get.offAll(LoginScreen());
                  },
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            )
          : favoriteController.userFavoriteList.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: ColorFiltered(
                          child: Image.asset(
                            "assets/shop.png",
                            fit: BoxFit.cover,
                          ),
                          colorFilter:
                              ColorFilter.mode(Colors.grey, BlendMode.srcIn),
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        'Es ist leer hier',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: greyColor),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Du musst angemeldet sein, um diese '
                        'Information sehen zu können',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                            color: greyColor),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : GetBuilder<FavoriteController>(builder: (_list) {
                  return ListView.builder(
                    controller: cs,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: favoriteController.userFavoriteList.length,
                    itemBuilder: (context, index) {
                      Resturant _resturant = _list.userFavoriteList[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => PageResturant(
                                resturant: _resturant,
                              ));
                        },
                        child: Container(
                          color: Theme.of(context).bottomAppBarTheme.color,
                          child: Column(
                            children: [
                              /////__________________ List Resturant _________/////////////////////////////7////
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 15, 15, 5),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                          _resturant.photoResturant!,
                                          height: 140,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.fitWidth),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    left: 20,
                                    child: Row(
                                      children: [
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 3, 5, 3),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Text(
                                              '${_resturant.deliveryDuration} min',
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .button!
                                                  .apply(fontSizeDelta: -1)),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 3, 5, 3),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          child: Text(
                                              '${(_resturant.distance! / 1000).toStringAsFixed(1)} km',
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .button!
                                                  .apply(fontSizeDelta: -1)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 20,
                                          alignment: Alignment.topLeft,
                                          margin:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            _resturant.nameResturant!,
                                            textAlign: TextAlign.center,
                                            textScaleFactor: 1.5,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .headline2,
                                          ),
                                        ),
                                        Container(
                                          height: 15,
                                          alignment: Alignment.topLeft,
                                          margin: const EdgeInsets.only(
                                              left: 15, top: 3),
                                          child: Text(
                                            _resturant.description!,
                                            textAlign: TextAlign.center,
                                            textScaleFactor: 1.0,
                                            style: Theme.of(context)
                                                .primaryTextTheme
                                                .subtitle1,
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(right: 15),
                                      height: 40,
                                      width: 80,
                                      child: Image.asset(
                                          _resturant.logoResturant!,
                                          height: 20,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.contain),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(bottom: 15, top: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 15,
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.only(
                                                left: 15, top: 7),
                                            child: Text(
                                              _resturant.ratingResturant
                                                  .toString(),
                                              textAlign: TextAlign.center,
                                              textScaleFactor: 1.0,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline3,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 15.0),
                                            child: rating(
                                                5.0, 0.0, 15.0, Colors.amber),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 15,
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.only(
                                                left: 15, top: 11),
                                            child: Text(
                                              "Liefergebühr",
                                              textAlign: TextAlign.center,
                                              textScaleFactor: 1.0,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline3,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "\€ ${_resturant.deliveryPrice.toString().padRight(4, '0')}",
                                              textAlign: TextAlign.center,
                                              textScaleFactor: 1.0,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline3,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 15,
                                            alignment: Alignment.topLeft,
                                            margin: const EdgeInsets.only(
                                                left: 15, top: 11, right: 15),
                                            child: Text(
                                              "Minimum",
                                              textAlign: TextAlign.center,
                                              textScaleFactor: 1.0,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline3,
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              "\€ ${_resturant.minimumOrder.toString().padRight(5, '0')}",
                                              textAlign: TextAlign.center,
                                              textScaleFactor: 1.0,
                                              style: Theme.of(context)
                                                  .primaryTextTheme
                                                  .headline3,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                                child: Container(
                                  color: Theme.of(context).backgroundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }),
    );
  }
}
