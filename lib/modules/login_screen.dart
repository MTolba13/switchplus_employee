import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:switchplus_employee/cache/cache_helper.dart';
import 'package:switchplus_employee/components/components.dart';
import 'package:switchplus_employee/logic/login/cubit/login_cubit.dart';
import 'package:switchplus_employee/modules/home_screen.dart';
import 'package:switchplus_employee/modules/register_screen.dart';
import 'package:switchplus_employee/styles/colors.dart';

var formKey = GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
              text: state.error,
            );
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(
                context,
                HomeScreen(),
              );
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[50],
              elevation: 0,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'login now to communicate with colleagues ',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                    fontFamily: 'Helvetica',
                                  ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        defaultFormField(
                          isPassword: true,
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'Password ',
                          prefix: Icons.lock_outline_rounded,
                          suffixPressed: () {
                            LoginCubit.get(context).changePasswordVisibility();
                          },
                          onSumbit: (value) {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          suffix: LoginCubit.get(context).suffix,
                          validate: (value) {
                            if (value.isEmpty) {
                              return 'please enter your Password';
                            }
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ConditionalBuilder(
                          builder: (context) => MaterialButton(
                            minWidth: double.infinity,
                            height: 49,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            textColor: Colors.white,
                            elevation: 10,
                            focusElevation: 10,
                            color: HexColor('004899'),
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            child: const Text(
                              'LOGIN',
                              style: TextStyle(
                                fontFamily: 'Helvetica',
                                fontSize: 20,
                              ),
                            ),
                          ),
                          condition: true,
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'Don\'t have an account?',
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: Colors.grey,
                                    fontFamily: 'Helvetica',
                                  ),
                        ),
                        TextButton(
                          onPressed: () {
                            navigateTo(
                              context,
                              const RegisterScreen(),
                            );
                          },
                          child: Text(
                            'Register Now',
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Helvetica',
                              color: secondColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
