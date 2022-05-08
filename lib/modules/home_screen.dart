import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switchplus_employee/logic/App_cubit/app_cubit.dart';
import 'package:switchplus_employee/models/price.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildPriceItem(
                    AppCubit.get(context).prices[index], context, index),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
                itemCount: 10,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildPriceItem(PriceModel model, context, index) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        elevation: 5,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: NetworkImage(
                    'https://www.apple.com/v/iphone-13-pro/f/images/overview/design/finishes_1_alpine_green__bxgqurawflau_large_2x.jpg'),
                // fit: BoxFit.cover,
                width: 100,
                height: 100,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'iPhone 13 Pro Max ',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              '128 gb',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 10),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '33,000 EGP',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              '128 gb',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 10),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '33,000 EGP',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              '128 gb',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 10),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '33,000 EGP',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Row(
              //       children: [
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Row(
              //               children: const [
              //                 Text(
              //                   'iPhone 13 Pro Max ',
              //                   style: TextStyle(
              //                     fontSize: 17,
              //                     fontWeight: FontWeight.bold,
              //                     height: 1.4,
              //                   ),
              //                 ),
              //                 SizedBox(
              //                   width: 5,
              //                 ),
              //               ],
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 15),
              //       child: Container(
              //         width: double.infinity,
              //         height: 1,
              //         color: Colors.grey[300],
              //       ),
              //     ),
              //     Column(
              //       children: [
              //         Text(
              //           '128 gb',
              //           style: Theme.of(context)
              //               .textTheme
              //               .caption!
              //               .copyWith(fontSize: 15),
              //         ),
              //         const SizedBox(
              //           height: 8,
              //         ),
              //         Text(
              //           '33,000 EGP',
              //           style: Theme.of(context)
              //               .textTheme
              //               .caption!
              //               .copyWith(fontSize: 10),
              //         ),
              //       ],
              //     ),
              //     const SizedBox(
              //       height: 8,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      );
}
