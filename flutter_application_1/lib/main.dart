import 'package:flutter/material.dart';
import 'package:flutter_application_1/Cubit/cubit/task8_cubit.dart';
import 'package:flutter_application_1/screens_cubit/RadioButton_screen.dart';
import 'screens_setState/screen_one.dart';
import 'screens_cubit/screen_one.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<Task8Cubit>(
            create: (BuildContext context) => Task8Cubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: RadioButton(),
      ),
    );
  }
}
