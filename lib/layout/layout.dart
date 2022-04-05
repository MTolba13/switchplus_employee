import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switchplus_employee/logic/app_cubit/app_cubit.dart';
import 'package:switchplus_employee/styles/icon_broken.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = AppCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Notification,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                IconBroken.Search,
              )),
        ],
        title: Text(
          cubit.titles[cubit.currentindex],
        ),
      ),
      body: cubit.screens[cubit.currentindex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: cubit.currentindex,
        onTap: (index) {
          cubit.changeBottomNav(index);
        },
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                IconBroken.Home,
              )),
          const BottomNavigationBarItem(
              label: 'Exams',
              icon: Icon(
                IconBroken.Chat,
              )),
          const BottomNavigationBarItem(
              label: 'Sales',
              icon: Icon(
                IconBroken.Paper_Upload,
              )),
          const BottomNavigationBarItem(
              label: 'Chats',
              icon: Icon(
                IconBroken.Location,
              )),
          const BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(
                IconBroken.Setting,
              )),
        ],
      ),
    );
  }
}
