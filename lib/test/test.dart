// ignore: non_constant_identifier_names
// import 'package:mjam/resturants/tabs_resturanrs.dart';

// void Cat() {

//   ignore: unused_local_variable
//   final List pizza = [
//     {'name': 'ali', 'age': 23},
//     {'name': 'bobb', 'age': 44},
//     {'name': 'sefff', 'age': 34},
//     {'name': 'frflkkkkklm', 'age': 8},
//     {'name': 'ui', 'age': 44},
//   ];
//   List<int> myList = [
//     1,
//     2,
//     3,
//     4,
//     5,
//     6,
//   ];
//   List<String> daysOfWeek = [
//     '  Montag',
//     '  Dienstag',
//     '  Mittwoch',
//     '  Donerstag',
//     '  Freitag',
//     '  Samastag',
//     '  Sonntag',
//   ];

//   var map1 = Map.fromIterable(ResList, key: (e) => e);

//   print(map1);

//   // int a = 1;
//   // int b = 2;
//   // // ignore: unnecessary_statements
//   // (a < b) | (a == 2)
//   //     ? print({(a < b) ? print('$a<$b') : print('a=$a')})
//   //     : print('object');

//   //----------------------------------------------------------------
//   //var s = daysOfWeek[0];
//   // print(s);    Montag

// //-------------------------------------------------------------------
//   daysOfWeek.forEach((n) {
//     // (daysOfWeek.length == 7) ? print(n) : print(myList);
//   });

// //----------------------------------------------------------------
//   // ignore: unused_local_variable
//   int foldSum = myList.fold(10, (value, n) => value + n);
//   //print(foldSum);   10 + [1+2+3+4+5+6] = 31

// //--------------------------------------------------------------
//   int squar(int i) {
//     return i * i;
//   }

//   List<int> suq = myList.map(squar).toList();
//   //print(suq);   [1,4,9,16,25,36]
//   //--------------------------------------------------------------
//   // ignore: unused_local_variable
//   List<int> filter = suq.where((n) => n > 10).toList();
//   //print(filter); [16,25,36]
// //----------------------------------------------------------------
//   // ignore: unused_local_variable
//   int sum = myList.reduce((value, n) => value + n);
//   //print(sum); 1+2+3+4+5+6
// //------------------------------------------------------------------

//   // ignore: unused_local_variable
//   List<String> convert = myList.map((num) => num.toString()).toList();
// //  print(Convert);    [1, 2, 3, 4, 5, 6]

// //--------------------------------------------------------------------

// //  print(daysOfWeek.join('  '));   Montag  Dienstag  Mittwoch  Donerstag  Freitag  Samastag  Sonntag

// //--------------------------------------------------------------------
//   daysOfWeek.forEach((day) {
//     //if (day[0] == 'M') print(day);     Montag  Mittwoch
//   });
// //--------------------------------------------------------------------
//   // ignore: unused_local_variable
//   String str = 'Faramarz';
//   //print(str.split(''));   [F,a,r,a,m,a,r,z]
// //--------------------------------------------------------------------
//   pizza.sort((a1, a2) => a1['age'] - a2['age']);
//   //print(pizza.reversed);
// //   ({name: ui, age: 44}, {name: bobb, age: 44}, {name: sefff, age: 34}, {name: ali, age: 23}, {name: frflkkkkklm, age: 8})
// //---------------------------------------------------------------------

//   // var j = pizza.map((e) => '${e['name']}    ${e['age']}  \n');
//   //print(j);

//   var f = pizza.where((a) => a['name'] == 'bob');
//   print(f);
//   print(pizza.skip(1));

//    for (int i = 0; i < 5; i++) print('Hello ${i + 1}');

//   for (var key in pizza.keys) {
//     print(key);
//   }
//   print('\n');
//   for (var value in pizza.values) {
//     print(value);
//   }

//   pizza.forEach((key, value) {
//     print('pizza  ${pizza['Aa']}');
//   });
// }
// ------------------------------------------------------------------------------
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// void main() =>
//     runApp(MaterialApp(debugShowCheckedModeBanner: false, home: QuoteList()));

// class QuoteList extends StatefulWidget {
//   @override
//   _QuoteListState createState() => _QuoteListState();
// }

// class _QuoteListState extends State<QuoteList> {
//   List<Qoute> quotes = [
//     Qoute(text: 'nfkj kskjfoiwjpqj', author: 'jndfoip wejewipd dbrwiv hduaak'),
//     Qoute(text: 'ooeqidc lki', author: 're9uiore dofihwezbn v ksuf kw'),
//     Qoute(text: 'fljkhp fk ld', author: 'reglkj900uh efhf7wfl932 i84wwdgsgs'),
//     Qoute(text: 'nfkj kskjfoiwjpqj', author: 'jndfoip wewipdpd dbrwiv hduaak'),
//     Qoute(text: 'ooeqidc lki', author: 're9uiore dofihwezbn v ksuf kw'),
//     Qoute(text: 'fljkhp fk ld', author: 'reglkj900uh efhf7wfl932 i84wwdgsgs')
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('New'),
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: [
//           Column(
//             children: quotes
//                 .map((qoute) => QuoteCard(
//                     qoute: qoute,
//                     delete: () {
//                       setState(() {
//                         quotes.remove(qoute);
//                       });
//                     }))
//                 .toList(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class QuoteCard extends StatelessWidget {
//   final Qoute qoute;
//   final Function delete;
//   QuoteCard({this.qoute, this.delete});
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
//       child: Padding(
//         padding: const EdgeInsets.all(14.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               qoute.text,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(
//               height: 6,
//             ),
//             Text(
//               qoute.author,
//               style: TextStyle(
//                 fontSize: 18,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(
//               height: 8,
//             ),
//             FlatButton.icon(
//                 onPressed: delete,
//                 icon: Icon(Icons.delete),
//                 label: Text('Löschen'))
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Qoute {
//   String text;
//   String author;

//   Qoute({this.text, this.author});
// }

// Qoute myqoute =
//     Qoute(text: 'aohk sdkh iuh hepoabf', author: 'sgd uziashojas kg');
