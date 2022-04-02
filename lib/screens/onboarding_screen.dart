// import 'package:concentric_transition/concentric_transition.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:switchplus_employee/screens/onboarding_card.dart';


// class OnBoardingScreen extends StatelessWidget {
//   OnBoardingScreen({Key? key}) : super(key: key);

//   final data = [
//     CardData(
//       title: "Sales Tracker",
//       subtitle: "you can modify your daily sales and track it day by day ",
//       image: const AssetImage("assets/images/tracker.png"),
//       backgroundColor: const Color.fromRGBO(0, 10, 56, 1),
//       titleColor: Colors.pink,
//       subtitleColor: Colors.white,
//       background: LottieBuilder.asset("assets/animation/bg-1.json"),
//     ),
//     CardData(
//       title: "In Store Offer",
//       subtitle: "you will find the updated in store offers ",
//       image: const AssetImage("assets/images/sale.png"),
//       backgroundColor: Colors.white,
//       titleColor: Colors.purple,
//       subtitleColor: const Color.fromRGBO(0, 10, 56, 1),
//       background: LottieBuilder.asset("assets/animation/bg-2.json"),
//     ),
//     CardData(
//       title: "Internal Exams",
//       subtitle: "we can do our exams with fun",
//       image: const AssetImage("assets/images/exams.png"),
//       backgroundColor: const Color.fromRGBO(71, 59, 117, 1),
//       titleColor: Colors.yellow,
//       subtitleColor: Colors.white,
//       background: LottieBuilder.asset("assets/animation/bg-3.json"),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ConcentricPageView(
//         colors: data.map((e) => e.backgroundColor).toList(),
//         itemCount: data.length,
//         itemBuilder: (int index, double value) {
//           return OnBoardingCard(data: data[index]);
//         },
//         onFinish: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) =>  LoginScreen()),
//           );
//         },
        
//       ),
//     );
//   }
// }
