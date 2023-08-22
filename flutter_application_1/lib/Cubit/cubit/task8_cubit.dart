import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'task8_state.dart';

//task2
String tempController = "";

class Task8Cubit extends Cubit<Task8State> {
  Task8Cubit() : super(Task8Initial());
//task1
  void buttonColorFunction(int i, buttonColor, value1, value2) {
    for (int j = 0; j < 6; j++) {
      if (j == i) {
        buttonColor[j] = value1;
      } else {
        buttonColor[j] = value2;
      }
    }
    emit(ButtonColorChange());
  }

//task2
  void ShowPasswordFunction(visibility, textController, value1, value2) {
    String hashedController = '';

    for (int i = 0; i < (textController.text).length; i++) {
      if (textController.text[i] == " ") {
        hashedController += " ";
      } else {
        hashedController += "*";
      }
    }

    if (visibility == value1) {
      textController.text = tempController;
      hashedController = "";
      print(tempController);
    } else {
      tempController = textController.text;
      textController.text = hashedController;
      print(tempController);
    }
    // print(textController.text);
    // print(hashedController);
    emit((ShowPassword()));
  }

//task3
  int selectedValue = 0;
  void RadioButtons(i) {
    selectedValue = i;
    // print(i + 1);
    emit(RaidoButton());
  }

//task4
  var shownItem = "";

  void ShowTextFunction() {
    shownItem = "text";
    // print("text");
    emit(ShowText());
  }

  void ShowImageFunction() {
    shownItem = "image";
    // print("image");
    emit(ShowImage());
  }

  void ShowCircleFunction() {
    shownItem = "circle";
    // print("circle");
    emit(ShowCircle());
  }

  void ResetFunction() {
    shownItem = "reset";
    // print("reset");
    emit(Reset());
  }
}
