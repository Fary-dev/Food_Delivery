// import 'package:flutter/material.dart';

// class Home extends StatelessWidget {
//   const Home({Key key, @required AnimationController controller})
//       : animation = HomePageEnterAnimation(controller),
//         super(key: key);
//   final HomePageEnterAnimation animation;

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: animation.controller,
//         builder: (context, child) => _buildAnimation(context, child, size),
//       ),
//     );
//   }

//   Container topbar(double height) {
//     return Container(
//       height: height,
//       width: double.infinity,
//       color: Colors.blue,
//     );
//   }

//   Positioned circle(Size size, double animationValue) {
//     return Positioned(
//       top: 200,
//       width: size.width / 2 - 50,
//       child: Transform(
//         alignment: Alignment.center,
//         transform: Matrix4.diagonal3Values(
//           animationValue,
//           animationValue,
//           1.0,
//         ),
//         child: Container(
//           height: 100,
//           width: 100,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100),
//             color: Colors.lightBlue[200],
//           ),
//         ),
//       ),
//     );
//   }

//   Align placeHolderBox(double height, double width, Alignment alignment) {
//     return Align(
//         alignment: alignment,
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             color: Colors.grey.shade300,
//           ),
//         ));
//   }

//   _buildAnimation(BuildContext context, Widget child, Size size) {
//     return Column(
//       children: [
//         SizedBox(
//           height: 250,
//           child: Stack(
//             // ignore: deprecated_member_use
//             overflow: Overflow.visible,
//             children: [
//               topbar(animation.barHeight.value),
//               circle(
//                 size,
//                 animation.avaterSize.value,
//               ),
//               Padding(
//                 padding: EdgeInsets.all(12),
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: 60,
//                     ),
//                     Opacity(
//                         opacity: animation.titleOpacity.value,
//                         child: placeHolderBox(28, 150, Alignment.centerLeft)),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     Opacity(
//                         opacity: animation.textOpacity.value,
//                         child: placeHolderBox(
//                             350, double.infinity, Alignment.centerLeft)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class HomePageEnterAnimation {
//   HomePageEnterAnimation(this.controller)
//       : barHeight = Tween<double>(begin: 0, end: 250).animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Interval(
//               0,
//               0.3,
//               curve: Curves.easeIn,
//             ),
//           ),
//         ),
//         avaterSize = Tween<double>(begin: 0, end: 1).animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Interval(
//               0.3,
//               0.6,
//               curve: Curves.elasticOut,
//             ),
//           ),
//         ),
//         titleOpacity = Tween<double>(begin: 0, end: 1).animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Interval(
//               0.6,
//               0.65,
//               curve: Curves.easeIn,
//             ),
//           ),
//         ),
//         textOpacity = Tween<double>(begin: 0, end: 1).animate(
//           CurvedAnimation(
//             parent: controller,
//             curve: Interval(
//               0.65,
//               0.8,
//               curve: Curves.easeIn,
//             ),
//           ),
//         );
//   final AnimationController controller;
//   final Animation<double> barHeight;
//   final Animation<double> avaterSize;
//   final Animation<double> titleOpacity;
//   final Animation<double> textOpacity;
// }
