import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenutilapp/screens/Audio_to_speech.dart';
import 'package:screenutilapp/utils/colors/colors.dart';

//get api data and show
class DashboardDetails extends StatefulWidget {
  var mysdata;
  DashboardDetails({super.key, required this.mysdata});

  @override
  State<DashboardDetails> createState() =>
      _DashboardDetailsState(mysdata: mysdata);
}

class _DashboardDetailsState extends State<DashboardDetails> {
  var mysdata;
  _DashboardDetailsState({required this.mysdata});

  //late var finalData;
  //late var serializedData;
  //String token =
  //  'eyJraWQiOiI0NGpcL0ZicGpmUlNLckZxZG5ZM0N3eFo5a2VFWVJLcVZcL05QVFlreFUxN3M9IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiI4ODM1MTk5ZS05ZTc3LTQ4MTQtYjYxZi00NDA1Zjk4ODQ2NjgiLCJpc3MiOiJodHRwczpcL1wvY29nbml0by1pZHAudXMtZWFzdC0yLmFtYXpvbmF3cy5jb21cL3VzLWVhc3QtMl82SVA5WWloTGUiLCJjbGllbnRfaWQiOiI3bnEycWttazdsbGJrY2hxYTZkcG45Z3U1ZiIsIm9yaWdpbl9qdGkiOiI1MjQ0YzdkMy02NTY3LTQ4MzUtOTBkMC04N2JlZDhiMjgwMjMiLCJldmVudF9pZCI6IjI5Y2FjMWQwLTQxOTgtNGY1My1iNWY5LWIxNGQzMGRjZjlkOSIsInRva2VuX3VzZSI6ImFjY2VzcyIsInNjb3BlIjoiYXdzLmNvZ25pdG8uc2lnbmluLnVzZXIuYWRtaW4iLCJhdXRoX3RpbWUiOjE2ODA3ODYzMDAsImV4cCI6MTY4MDc4ODEwMCwiaWF0IjoxNjgwNzg2MzAwLCJqdGkiOiJhNjZiZWNlYi03ZDVhLTQ0MzEtOTJlYi1kN2Q5N2MyMDhjOGYiLCJ1c2VybmFtZSI6Ijg4MzUxOTllLTllNzctNDgxNC1iNjFmLTQ0MDVmOTg4NDY2OCJ9.0QIUn7PzntEnowWroJGqVQl2XhS0JMcuWYmMv8Yxy-ocrr4TZemW9m2KY-y-2Szsag29DXZ-EwgyZfVUsIRPpixa-KfR_H9sbi5588PcWeVpm4oxWhtvkaYg9nP2VnY2vjw28V_jvDe_yfbBpwTQ7npWrtDV4GWWH7CKv7n2Mn5s2OFtCQCFF8oCqoihBAmMHitJRmeNEtQgfiPbLMFRwT-RMBY5N6AmDajFGK5YA_Kq1_kispl3jmLKSPl0tyJeb5NvQSaClRCW_CDE7TAAC93pdGqOhifp_nOIxUhHPbqMV6WawpKcCNLSU1qP2JdF5Pe7lqrPnOErlz2eAwTH-A';
  //List<PatientModel> PatientDetails = [];

  // void initState() {
  //   super.initState();
  //   //final finalData = getPatientDeatails();
  // }

  // Future<Object> getPatientDeatails() async {
  //   AppUrl appUrl = AppUrl();
  //   Uri uri = Uri.parse(appUrl.patientExreciseUrl.toString());
  //   var params = {
  //     HttpHeaders.authorizationHeader: token
  //   }; //incase of token usage-->params
  //   final response = await http.get((uri), headers: params);
  //   var data = jsonDecode(response.body.toString());
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     print(data);
  //     final serializedData = PatientModel.fromJson(data);
  //     print("////");
  //     print(serializedData.runtimeType);

  //     return serializedData;
  //   } else {
  //     print("////");
  //     print(PatientDetails);
  //     return serializedData;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // for (final i in mysdata) {
    //   print(i);
    // }
    // var mysdata;
    print(mysdata);
    return Scaffold(
      appBar: AppBar(title: Text("Patient details")),
      body: Column(
        children: [
          Text(mysdata),
          SizedBox(
            height: 200.h,
          ),
          GestureDetector(
            onTap: (() {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: (context) {});
            }),
            child: Container(
              decoration: BoxDecoration(color: MyColors.buttonColor),
              child: Text("Speech to text task"),
            ),
          )
          //using the got data
          // TextButton(
          //     onPressed: () {
          //       final serData = getPatientDeatails();
          //       Navigator.of(context).push(MaterialPageRoute(
          //           builder: (context) => NextPage(
          //                 data: serData,
          //               )));
          //     },
          //     child: Text("ok"))
          // TextButton(
          //   onPressed: () {
          //     var data = getPatientDeatails();
          //     Get.defaultDialog(title: data.toString());
          //   },
          //   child: Text("okkk"),
          // )
          //     child: Text("activate api")),
          // FutureBuilder(
          //     future: getPatientDeatails(),
          //     builder: ((context, snapshot) {
          //       if (!snapshot.hasData) {
          //         return Text(snapshot.error.toString());
          //       } else {
          //         try {
          //           return ListView.builder(
          //               itemCount: snapshot.data!.length,
          //               itemBuilder: ((context, index) {
          //                 return ListTile();
          //               }));
          //         } catch (error) {
          //           return Container(
          //             child: AlertDialog(
          //                 title: Text("Error"),
          //                 semanticLabel: error.toString()),
          //           );
          //           // Get.defaultDialog(
          //           //     title: "Error", middleText: error.toString());
          //           // Get.back();
          //         }
          //       }
          //     }))
        ],
      ),
    );
  }
}
