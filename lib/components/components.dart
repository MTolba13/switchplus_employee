// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:switchplus_employee/styles/colors.dart';
import 'package:switchplus_employee/styles/icon_broken.dart';

void navigateTo(context, widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (Route) => false,
    );

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        required String label,
        required IconData prefix,
        IconData? suffix,
        required var validate,
        bool isPassword = false,
        var suffixPressed,
        void Function(String)? onSumbit,
        var onTap,
        dynamic onChange}) =>
    TextFormField(
      style: const TextStyle(
        fontFamily: 'Helvetica',
        fontSize: 15,
      ),
      onFieldSubmitted: onSumbit,
      onChanged: onChange,
      onTap: onTap,
      obscureText: isPassword,
      validator: validate,
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        suffixIcon: IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
            color: Colors.black,
          ),
        ),
        labelText: label,
        prefixIcon: Icon(
          prefix,
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black)),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
      ),
    );

void showToast({
  required String text,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 15,
    );

Widget defaultButton({
  // double width = double.infinity,
  Color color = const Color.fromARGB(0, 72, 153, 1),
  bool isUpperCase = true,
  double radius = 0.0,
  required Function function,
  required String text,
}) =>
    Container(
      // width: width,
      height: 40.0,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Helvetica',
          ),
        ),
        onPressed: () {
          function();
        },
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );

PreferredSizeWidget? defualtAppBar({
  required BuildContext context,
  String? title,
  List<Widget>? actions,
}) =>
    AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(IconBroken.Arrow___Left_2),
        color: secondColor,
      ),
      title: Text(title!),
      titleSpacing: 5,
      actions: actions,
    );
