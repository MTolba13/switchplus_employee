import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switchplus_employee/constants/constansts.dart';
import 'package:switchplus_employee/models/user.dart';
import 'package:switchplus_employee/styles/icon_broken.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    )
        .then((value) {
      uId = value.user!.uid;

      emit(RegisterSuccessState());

      userCreate(
        name: name,
        email: email,
        password: password,
        phone: phone,
        uId: value.user!.uid,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String? name,
    required String? email,
    required String? password,
    required String? phone,
    required String? uId,
  }) {
    UserModel model = UserModel(
      name: name,
      email: email,
      password: password,
      phone: phone,
      uId: uId,
      // bio: 'write your bio ...',
      // image:
      //     'https://image.freepik.com/free-photo/portrait-bearded-casually-dressed-man-glasses-with-dark-curly-hair_295783-1419.jpg',
      // cover:
      //     'https://image.freepik.com/free-photo/photo-thoughtful-handsome-adult-european-man-holds-chin-looks-pensively-away-tries-solve-problem_273609-45891.jpg',
      // isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? IconBroken.Lock : IconBroken.Unlock;
    emit(RegisterChangePasswordVisibilityState());
  }
}
