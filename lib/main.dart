import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switchplus_employee/cache/cache_helper.dart';
import 'package:switchplus_employee/constants/constansts.dart';
import 'package:switchplus_employee/layout/layout.dart';
import 'package:switchplus_employee/logic/App_cubit/app_cubit.dart';
import 'package:switchplus_employee/modules/home_screen.dart';
import 'package:switchplus_employee/modules/login_screen.dart';
import 'package:switchplus_employee/modules/onboarding_screen.dart';
import 'package:switchplus_employee/styles/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheHelper.init();

  Widget? widget;

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = const AppLayout();
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({
    Key? key,
    required this.startWidget,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubit()..getUserData(),
        ),
      ],
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            home: startWidget,
          );
        },
      ),
    );
  }
}
