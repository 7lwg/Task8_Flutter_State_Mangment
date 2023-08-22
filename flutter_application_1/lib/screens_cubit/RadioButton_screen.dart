import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/cubit/task8_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RadioButton extends StatelessWidget {
  RadioButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 20; i++)
              BlocBuilder<Task8Cubit, Task8State>(
                builder: (context, state) {
                  return Container(
                    height: 30,
                    child: Row(children: [
                      Transform.scale(
                          scale: 1.4,
                          child: Radio(
                              value: i,
                              groupValue:
                                  context.read<Task8Cubit>().selectedValue,
                              onChanged: (value) {
                                context.read<Task8Cubit>().RadioButtons(i);
                              })),
                      Text(
                        "${i + 1} Element",
                        style: TextStyle(fontSize: 20),
                      ),
                    ]),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
