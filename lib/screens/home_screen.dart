import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenutilapp/api_urls/Urls.dart';
import 'package:screenutilapp/models/Patient_model.dart';
import 'package:screenutilapp/screens/Audio_to_speech.dart';
import 'package:screenutilapp/screens/getxsm.dart';

import 'package:screenutilapp/utils/colors/colors.dart';
import 'package:screenutilapp/utils/components.dart';

import '../dashboard/dashboard_details.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String token =
      'eyJraWQiOiI0NGpcL0ZicGpmUlNLckZxZG5ZM0N3eFo5a2VFWVJLcVZcL05QVFlreFUxN3M9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI4ODM1MTk5ZS05ZTc3LTQ4MTQtYjYxZi00NDA1Zjk4ODQ2NjgiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtZWFzdC0yLmFtYXpvbmF3cy5jb21cL3VzLWVhc3QtMl82SVA5WWloTGUiLCJjbGllbnRfaWQiOiI3bnEycWttazdsbGJrY2hxYTZkcG45Z3U1ZiIsIm9yaWdpbl9qdGkiOiJlMTFjOTkyMy0yYjRmLTQxMjctYTkzMy0wNmJiNDM3NWY2MWQiLCJldmVudF9pZCI6ImIwYjI5ZWZiLWQ5MzAtNDQxNC1iMjhlLTYzNzNjMTcwMWJmZiIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE2ODA4NDUxNjQsImV4cCI6MTY4MDg0Njk2NCwiaWF0IjoxNjgwODQ1MTY0LCJqdGkiOiI4N2U4MzVlZC00ODljLTQ5OTctYTMxNS1mMGY2MGE3NjllODMiLCJ1c2VybmFtZSI6Ijg4MzUxOTllLTllNzctNDgxNC1iNjFmLTQ0MDVmOTg4NDY2OCJ9.nB6y8UAaaxxdXI_8PIwpCD7UxB-61HEMiqzKVNScWqEOC9TPs-yk9knGQxFzibfswAWR_Bv_BL72p0m9qoyqReqr4kc65YOyuMjyDcIv5wxRdpzK6ejqJ3rnv7du_BVOJx6g_dsBmfWBiHsZ0IC3AW_L4GP-AhTKEDqAOZDgqPyc7-R7Xi1hF1k85AwHzd5EiylM7nTqZYza-Fhtb3jwl9zeCYaxsFx97IxxV3Yz9y5OkukXypRoylLQ_XSki_5OTGa_RLs9FbvFt8jPh_rOKXDlm8RzBDhEal-FB1YGSq0LOB2sCYpDgaTEX9zmcaUglvtlg1S5wdiNVoXXEAs74w';
  Future<Object> getPatientDeatails() async {
    AppUrl appUrl = AppUrl();
    Uri uri = Uri.parse(appUrl.patientExreciseUrl.toString());
    var params = {
      HttpHeaders.authorizationHeader: token
    }; //incase of token usage-->params
    final response = await http.get((uri), headers: params);
    var data = jsonDecode(response.body);
    var serializedData;
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(data);
      final serializedData = PatientModel.fromJson(data);
      print("////");
      print(serializedData.runtimeType);
      return serializedData;
    } else {
      print("////");
      //print(PatientDetails);
      return serializedData;
    }
  }

  bool check = false;
  @override
  Widget build(BuildContext context) {
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
                ),
                SizedBox(
                  height: 50.h,
                ),
                TextButton(
                    onPressed: () async {
                      final serilizedaData = await getPatientDeatails();
                      print(serilizedaData);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DashboardDetails(
                            mysdata:
                                serilizedaData), //passing to dashboard page
                      ));
                    },
                    child: Text("task 2 API Handling")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SpeechScreen()));
                    },
                    child: Text("task Speech to text")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CounterPgae()));
                    },
                    child: Text("Getx Taksk")),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CounterPgae()));
                    },
                    child: Text("Graphs"))
              ]),
            )),
          )),
    );
  }
}
