import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_mangement/Cubit/ConvertUI/convert_ui_cubit.dart';
import 'package:state_mangement/Cubit/FastFilterBar/fast_filter_bar_cubit.dart';
import 'package:state_mangement/Cubit/Password/password_cubit.dart';
import 'package:state_mangement/Cubit/Radio/radio_cubit.dart';
import 'package:state_mangement/Screens/State%20Mangment/fast_filter_bar_with_cubit.dart';
import 'package:state_mangement/Screens/State%20Mangment/fast_filter_bar_with_setstate.dart';
import 'package:state_mangement/Screens/test.dart';

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
        BlocProvider<FastFilterBarCubit>(
          create: (BuildContext context) => FastFilterBarCubit(),
        ),
        BlocProvider<PasswordCubit>(
          create: (BuildContext context) => PasswordCubit(),
        ),
        BlocProvider<RadioCubit>(
          create: (BuildContext context) => RadioCubit(),
        ),
        BlocProvider<ConvertUiCubit>(
          create: (BuildContext context) => ConvertUiCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: FastFilterBarWithCuibt(),
      ),
    );
  }
}
