import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:mjam/Contants/Color.dart';
import 'package:mjam/Screens/Banner/banner_Screen_1.dart';

class Banr extends StatefulWidget {
  Banr({Key? key}) : super(key: key);
  //CarouselDemo() : super();

  final String? title = "CarouselDemo";

  @override
  BanrState createState() => BanrState();
}

class BanrState extends State<Banr> {
  final transitiontype = ContainerTransitionType.fade;
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final CarouselController _buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          CarouselSlider(
            carouselController: _buttonCarouselController,
            options: CarouselOptions(
              onPageChanged: (i, listBanner) {
                setState(() {
                  _current = i;
                });
              },
              viewportFraction: 1.0,
              height: 160,
              initialPage: 0,
              enlargeCenterPage: false,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              aspectRatio: 16 / 9,
              autoPlayInterval: Duration(seconds: 5),
              autoPlayAnimationDuration: Duration(milliseconds: 100),
              pauseAutoPlayOnTouch: true,
              scrollDirection: Axis.horizontal,
            ),
            items: listBanner.map((listBanner) {
              return Builder(builder: (BuildContext context) {
                return OpenContainer(
                  closedColor: Theme.of(context).backgroundColor,
                  transitionType: transitiontype,
                  transitionDuration: Duration(milliseconds: 1500),
                  closedBuilder:
                      (BuildContext context, VoidCallback openContainer) =>
                          Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      child: InkWell(
                        onTap: openContainer,
                        child: Image(
                          image: AssetImage(
                            listBanner.photo,
                          ),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  openBuilder: (BuildContext context, _) => BannerScreen1(
                    bannerGeneraly: listBanner,
                  ),
                );
              });
            }).toList(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: map<Widget>(listBanner, (i, listBanner) {
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == i
                      ? primaryColor
                      : Theme.of(context).hoverColor,
                ),
              );
            }),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}

class BannerGeneraly {
  String photo;
  String title;
  String subtitle;
  BannerGeneraly(
    this.photo,
    this.title,
    this.subtitle,
  );
}

final List<BannerGeneraly> listBanner = [
  BannerGeneraly("assets/mc2.jpg", 'Mcdounolds',
      'Ab sofort d??rfen wir dich und deine Liebsten endlich wieder im gesamten Restaurant und im Gastgarten zu Tisch bitten.\nEinfach g??ltigen negativen Covid-Test, Nachweis der Genesung oder Impfnachweis vorweisen, Platz nehmen und genie??en.\nWelche Tests sind g??ltig?\nAntigen Test ??? nicht ??lter als 48 Stunden ^\nPCR Test ??? nicht ??lter als 72 Stunden\nDigital erfasster Selbst-Test ??? nicht ??lter als 24 Stunden\nSch??ler-Corona-Testpass (Kinder 10+) ??? g??ltig, wenn Sticker im aufgedruckten Zeitraum geklebt\nDie Tests m??ssen NEGATIV und beh??rdlich anerkannt sein.\nWer muss einen Test vorweisen? ALLE Personen, die im Restaurant/Gastgarten essen m??chten, das gilt auch f??r Kinder ab 10 Jahren.\nWer muss sich registrieren? Ebenfalls ALLE Personen, die im Restaurant/Gastgarten essen m??chten. Das funktioniert elektronisch, mittels QR-Code, oder handschriftlich. Wer sich nicht registrieren m??chte, kann die Bestellung mitnehmen.'),
  BannerGeneraly("assets/obs1.jpg", 'Obst',
      'Ohne Vitamine, Mineralstoffe und Spurenelemente k??nnen Menschen nicht leben. Sie sind n??tig f??r den Aufbau von Zellen, Blutk??rperchen, Knochen, Z??hnen. Und sie erf??llen wichtige Aufgaben im Stoffwechsel und beim Zusammenspiel von Nerven und Muskeln. Vitamin A etwa ist wichtig f??r das Sehverm??gen, Vitamin D f??r die Kalziumaufnahme und gesunde Knochen. Mineralstoffe wie Calcium, Natrium, Kalium und Magnesium haben ebenfalls wichtige Funktionen im K??rper. Spurenelemente (auch Mikroelemente genannt) ben??tigt der K??rper nur in sehr kleinen Mengen. Wichtige Spurenelemente sind zum Beispiel Eisen als Bestandteil der roten Blutk??rperchen und Jod f??r die Funktionen der Schilddr??se.'),
  BannerGeneraly("assets/pom1.jpg", 'Pommes',
      'Pommes selber machen ist simpel und kein Hexenwerk. Sie sind der wohl beliebteste Snack nicht nur in der Imbissbude an der Ecke. Ich behaupte jetzt einfach mal, dass du mit diesem Rezept die besten Pommes machst und sie sogar leckerer werden, als an der ???Pommesbude um die Ecke???. In diesem Beitrag zeige ich dir, wie du Pommes ohne Fritteuse selber machen kannst.'),
  BannerGeneraly("assets/ham1.jpg", 'Hamburger',
      'Hamburger Containerboard, part of the Austrian Prinzhorn Holding, offers its partners throughout Europe a full programme of high-quality corrugated case material products.\nProduction is based in four European countries: Germany, Austria, Hungary and Turkey. The group produces high-quality corrugated case material, as well as plasterboard liner and paperboard.'),
];
