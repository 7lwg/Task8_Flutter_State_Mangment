import 'package:flutter/material.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
  String tempController = "";
  // var hashedController = "";
  String hashedController = '';

  //task4
  var shownItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
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
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(buttonColor[i])),
                        onPressed: () {
                          for (int j = 0; j < 6; j++) {
                            if (j == i) {
                              buttonColor[j] = Colors.blue;
                            } else {
                              buttonColor[j] = Colors.grey;
                            }
                          }
                          setState(() {});
                        },
                        child: Text(
                          buttonName[i],
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 10,
            height: MediaQuery.of(context).size.height * (1 / 10),
            color: Colors.white,
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: TextButton(
                    onPressed: () {
                      if (visibility == Icons.visibility) {
                        visibility = Icons.visibility_off;
                      } else {
                        visibility = Icons.visibility;
                      }
                      // print(textController);
                      for (int i = 0; i < (textController.text).length; i++) {
                        if (textController.text[i] == " ") {
                          hashedController += " ";
                        } else {
                          hashedController += "*";
                        }
                      }

                      if (visibility == Icons.visibility) {
                        textController.text = tempController;
                        hashedController = "";
                      } else {
                        tempController = textController.text;
                        textController.text = hashedController;
                      }
                      setState(() {});
                    },
                    child: Icon(visibility,
                        color: const Color.fromARGB(255, 145, 142, 142),
                        size: 25),
                    style: ButtonStyle(
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                controller: textController,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * (1 / 2),
            child: Column(
              children: [
                if (shownItem == "text")
                  SizedBox(
                    height: 100,
                    child: Text(
                      "Ahmed Othman",
                    ),
                  ),
                if (shownItem == "image")
                  Image.network(
                    'https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp',
                    width: 100,
                    height: 100,
                  ),
                if (shownItem == 'circle')
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
                      shownItem = "text";
                      setState(() {});
                    },
                    child: Text('show text')),
                ElevatedButton(
                    onPressed: () {
                      shownItem = "image";
                      setState(() {});
                    },
                    child: Text('show image')),
                ElevatedButton(
                    onPressed: () {
                      shownItem = "circle";
                      setState(() {});
                    },
                    child: Text('show red circle')),
                ElevatedButton(
                    onPressed: () {
                      shownItem = "reset";
                      setState(() {});
                    },
                    child: Text('reset')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
