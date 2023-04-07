import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  var data;
  NextPage({super.key, required this.data});

  void myfunciton() {
    print(data);
  }

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    var data;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextButton(
              onPressed: null,
              child: Text("ok"),
            )
          ],
        ),
      ),
    );
  }
}
