import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenutilapp/controller/controllers.dart';
import 'package:screenutilapp/utils/colors/colors.dart';
import 'package:screenutilapp/utils/components.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    Controllers controllers = Controllers();
    // creating instance for usage

    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColors.bgColor,
          body: SingleChildScrollView(
            child: Expanded(
                child: Padding(
              padding: EdgeInsets.all(5.sp),
              child: Column(children: [
                Text(
                  "Welcome to Home",
                  style: textTheme.headline1,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 100.h,
                ),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.purple.shade100,
                    ),
                    height: 100.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "Row element 1",
                          style: TextStyle(fontSize: 18.sp),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              // const Text(
                              //   "Row element 2, consists of 3 stack elements",
                              // ),
                              Container(
                                alignment: Alignment.bottomRight,
                                height: 80.h,
                                width: 150.w,
                                color: Colors.red,
                                child: Text(
                                  "stack 1",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                height: 70.h,
                                width: 130.w,
                                color: Colors.blue,
                                child: Text(
                                  "stack 2",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ),
                              // Text("stack element 1"),
                              // Text("stack element 2"),
                              // Text("stack element 3"),
                              // Text(
                              //   "outside column",
                              //   textAlign: TextAlign.justify,
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                    // color: Colors.purple.shade100,
                  ),
                ),
                Text(
                  "card 2",
                  style: TextStyle(fontSize: 18.sp),
                  textAlign: TextAlign.left,
                ),
                Card(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.purple.shade100,
                    ),
                    height: 100.h,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Text(
                          "Row element 1",
                          style: TextStyle(fontSize: 18.sp),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        Expanded(
                          child: Stack(
                            children: [
                              Container(
                                alignment: Alignment.bottomRight,
                                height: 80.h,
                                width: 150.w,
                                color: Colors.red,
                                child: Text(
                                  "stack 1",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                height: 70.h,
                                width: 130.w,
                                color: Colors.blue,
                                child: Text(
                                  "stack 2",
                                  style: TextStyle(fontSize: 18.sp),
                                ),
                              ),
                              // Text("stack element 1"),
                              // Text("stack element 2"),
                              // Text("stack element 3"),
                              // Text(
                              //   "outside column",
                              //   textAlign: TextAlign.justify,
                              // )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )),
          )),
    );
  }
}
