import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:switchplus_employee/cache/cache_helper.dart';
import 'package:switchplus_employee/components/components.dart';
import 'package:switchplus_employee/modules/login_screen.dart';
import 'package:switchplus_employee/styles/colors.dart';
import 'package:switchplus_employee/styles/icon_broken.dart';

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;

  BoardingModel({required this.body, required this.image, required this.title});
}

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/tracker.png',
        title: 'Sales Tracker',
        body: 'you can modify your daily sales and track it day by day'),
    BoardingModel(
        image: 'assets/images/Discount-cuate.png',
        title: 'In Store Offer',
        body: 'you will find the updated in store offers'),
    BoardingModel(
        image: 'assets/images/exams.png',
        title: 'Internal Exams',
        body: 'we can do our exams with fun'),
  ];

  bool isLast = false;

  void sumbit() {
    CacheHelper.saveData(
      key: 'onBoarding',
      value: true,
    ).then((value) {
      if (value) {
        navigateAndFinish(
          context,
          const LoginScreen(),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[50],
          elevation: 0,
          actions: [
            TextButton(
              onPressed: sumbit,
              child: Text(
                'Skip',
                style: TextStyle(
                  color: firstColor,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  onPageChanged: (int index) {
                    if (index == boarding.length - 1) {
                      setState(() {
                        isLast = true;
                      });
                    } else {
                      setState(() {
                        isLast = false;
                      });
                    }
                  },
                  controller: boardController,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      buildBoardingItem(boarding[index]),
                  itemCount: boarding.length,
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                      activeDotColor: firstColor,
                      dotColor: secondColor,
                      dotHeight: 10,
                      expansionFactor: 3,
                      dotWidth: 10,
                      spacing: 5,
                    ),
                    controller: boardController,
                    count: boarding.length,
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    backgroundColor: secondColor,
                    elevation: 10,
                    onPressed: () {
                      if (isLast) {
                        sumbit();
                      } else {
                        boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastOutSlowIn,
                        );
                      }
                    },
                    child: Icon(
                      IconBroken.Arrow___Right,
                      color: firstColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${model.title}',
            style: TextStyle(
              color: firstColor,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
              fontSize: 38,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              color: secondColor,
              fontFamily: 'Helvetica',
              // fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      );
}
