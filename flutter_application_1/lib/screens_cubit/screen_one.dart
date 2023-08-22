import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/cubit/task8_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenOneCubit extends StatelessWidget {
  ScreenOneCubit({super.key});

  //task1
  List buttonName = [
    "قيد التنفيذ",
    "الملغيه",
    "المكتمله",
    "تحت المراجعه",
    "تمت",
    "اضف الى السله"
  ];
  int x = 0;
  List buttonColor = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];

  //task2
  var visibility = Icons.visibility;
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * (1 / 8),
              color: Color.fromARGB(255, 237, 234, 234),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int i = 0; i < 6; i++)
                      Container(
                        margin: EdgeInsets.all(5),
                        child: BlocBuilder<Task8Cubit, Task8State>(
                          builder: (context, state) {
                            return TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      buttonColor[i])),
                              onPressed: () {
                                context.read<Task8Cubit>().buttonColorFunction(
                                    i, buttonColor, Colors.blue, Colors.grey);
                              },
                              child: Text(
                                buttonName[i],
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          },
                        ),
                      )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              width: MediaQuery.of(context).size.width - 10,
              height: MediaQuery.of(context).size.height * (1 / 10),
              color: Colors.white,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: BlocBuilder<Task8Cubit, Task8State>(
                      builder: (context, state) {
                        return TextButton(
                          onPressed: () {
                            if (visibility == Icons.visibility) {
                              visibility = Icons.visibility_off;
                            } else {
                              visibility = Icons.visibility;
                            }
                            context.read<Task8Cubit>().ShowPasswordFunction(
                                visibility,
                                textController,
                                Icons.visibility,
                                Icons.visibility_off);
                            // if (visibility == Icons.visibility) {
                            //   visibility = Icons.visibility_off;
                            // } else {
                            //   visibility = Icons.visibility;
                            // }
                            // // print(textController);
                            // for (int i = 0;
                            //     i < (textController.text).length;
                            //     i++) {
                            //   if (textController.text[i] == " ") {
                            //     hashedController += " ";
                            //   } else {
                            //     hashedController += "*";
                            //   }
                            // }

                            // if (visibility == Icons.visibility) {
                            //   textController.text = tempController;
                            //   hashedController = "";
                            // } else {
                            //   tempController = textController.text;
                            //   textController.text = hashedController;
                            // }
                            // setState(() {});
                          },
                          child: Icon(visibility,
                              color: const Color.fromARGB(255, 145, 142, 142),
                              size: 25),
                          style: ButtonStyle(
                            overlayColor:
                                MaterialStateProperty.all(Colors.transparent),
                          ),
                        );
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  controller: textController,
                ),
              ),
            ),
          ),
          BlocBuilder<Task8Cubit, Task8State>(
            builder: (context, state) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * (1 / 2),
                child: Column(
                  children: [
                    if (context.read<Task8Cubit>().shownItem == "text")
                      SizedBox(
                        height: 80,
                        child: Text(
                          "Ahmed Othman",
                        ),
                      ),
                    if (context.read<Task8Cubit>().shownItem == "image")
                      Image.network(
                        'https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp',
                        width: 100,
                        height: 100,
                      ),
                    if (context.read<Task8Cubit>().shownItem == 'circle')
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<Task8Cubit>().ShowTextFunction();
                        },
                        child: Text('show text')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<Task8Cubit>().ShowImageFunction();
                        },
                        child: Text('show image')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<Task8Cubit>().ShowCircleFunction();
                        },
                        child: Text('show red circle')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<Task8Cubit>().ResetFunction();
                        },
                        child: Text('reset')),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
