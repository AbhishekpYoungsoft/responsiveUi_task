import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController {
  RxInt getCounter = 1
      .obs; //obs is a oberserver whch checks whether the var is changing or chnaging

  IncrementCounter() {
    getCounter.value++; //note .value is imp
    print(getCounter.value);
  }
}
