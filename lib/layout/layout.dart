import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switchplus_employee/styles/colors.dart';
import 'package:switchplus_employee/styles/icon_broken.dart';

import '../logic/App_cubit/app_cubit.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: defaultColor,
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
              style: const TextStyle(fontFamily: 'Helvetica'),
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
                    IconBroken.Document,
                  )),
              const BottomNavigationBarItem(
                  label: 'Sales',
                  icon: Icon(
                    IconBroken.Chart,
                  )),
              const BottomNavigationBarItem(
                  label: 'Chats',
                  icon: Icon(
                    IconBroken.Chat,
                  )),
              const BottomNavigationBarItem(
                label: 'Settings',
                icon: Icon(
                  IconBroken.Setting,
                ),
              ),
            ],
            fixedColor: defaultColor,
            unselectedItemColor: Colors.grey,
            elevation: 0,
            iconSize: 30,
            selectedLabelStyle: const TextStyle(
              fontFamily: 'Helvetica',
            ),
          ),
        );
      },
    );
  }
}
