import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:switchplus_employee/constants/constansts.dart';
import 'package:switchplus_employee/models/user.dart';
import 'package:switchplus_employee/modules/chat_screen.dart';
import 'package:switchplus_employee/modules/exams_screen.dart';
import 'package:switchplus_employee/modules/home_screen.dart';
import 'package:switchplus_employee/modules/sales_screen.dart';
import 'package:switchplus_employee/modules/settings_screen.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  UserModel? model;

  void getUserData() {
    emit(AppGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      emit(AppGetUserSuccessState());
    }).catchError(
      (error) {
        emit(
          AppGetUserErrorState(error.toString()),
        );
      },
    );
  }

  int currentindex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ExamsScreen(),
    const SalesScreen(),
    const ChatScreen(),
    const SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Exams',
    'Sales',
    'Chats',
    'Settings',
  ];

  void changeBottomNav(int index) {
    // if (index == 2) {
    //   emit(SocialNewPostState());
    // } else {
    //   currentindex = index;
    //   emit(SocialChangeBottomNavState());
    // }

    currentindex = index;
    emit(AppChangeBottomNavState());
  }
}
