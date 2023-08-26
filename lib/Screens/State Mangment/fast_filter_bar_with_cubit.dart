import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_mangement/Cubit/ConvertUI/convert_ui_cubit.dart';
import 'package:state_mangement/Cubit/FastFilterBar/fast_filter_bar_cubit.dart';
import 'package:state_mangement/Cubit/Password/password_cubit.dart';
import 'package:state_mangement/Cubit/Radio/radio_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FastFilterBarWithCuibt extends StatefulWidget {
  FastFilterBarWithCuibt({
    super.key,
  });

  @override
  State<FastFilterBarWithCuibt> createState() => _FastFilterBarWithCuibtState();
}

class _FastFilterBarWithCuibtState extends State<FastFilterBarWithCuibt> {
  List name = ['تمت', 'تحت المراجعة', 'المكتملة', 'الملغية', 'قيد التنفيذ'];

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('Using_Cuibt'))),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    BlocBuilder<FastFilterBarCubit, FastFilterBarState>(
                      builder: (context, state) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0; i < name.length; i++)
                                GestureDetector(
                                  onTap: () {
                                    context
                                        .read<FastFilterBarCubit>()
                                        .changeButtonColor(i);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(5),
                                    height: 35,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: context
                                                    .read<FastFilterBarCubit>()
                                                    .TappedButtonIndex ==
                                                i
                                            ? Colors.blue
                                            : const Color.fromARGB(
                                                255, 217, 217, 217),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25))),
                                    child: Center(
                                        child: Text(
                                      name[i],
                                      style: GoogleFonts.nunito(fontSize: 18),
                                    )),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    SizedBox(
                      height: 500,
                      child: BlocBuilder<RadioCubit, RadioState>(
                        builder: (context, state) {
                          return ListView.builder(
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return RadioListTile(
                                value: index,
                                groupValue:
                                    context.read<RadioCubit>().currentradio,
                                onChanged: (value) {
                                  context.read<RadioCubit>().currentradio =
                                      value!;
                                  context.read<RadioCubit>().button();
                                },
                                title: Text('text ${index + 1}'),
                              );
                            },
                          );
                        },
                      ),
                    ),

                    const SizedBox(
                      height: 70,
                    ),

                    BlocBuilder<PasswordCubit, PasswordState>(
                      builder: (context, state) {
                        return TextFormField(
                          obscureText: context.read<PasswordCubit>().isshow,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            suffixIcon:
                                BlocBuilder<PasswordCubit, PasswordState>(
                              builder: (context, state) {
                                return IconButton(
                                  icon: context.read<PasswordCubit>().isshow
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility),
                                  onPressed: () {
                                    context
                                        .read<PasswordCubit>()
                                        .PasswordVisibility();
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),

////////////////////////

                    const SizedBox(
                      height: 50,
                    ),
                    BlocBuilder<ConvertUiCubit, ConvertUiState>(
                      builder: (context, state) {
                        if (state is ShowText) {
                          return const Text(
                            'We are iTi-2023',
                            style: TextStyle(fontSize: 20),
                          );
                        } else if (state is ShowImage) {
                          return const Image(
                            image: NetworkImage(
                                'https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp'),
                            height: 100,
                            width: 100,
                          );
                        } else if (state is ShowCircle) {
                          return Container(
                            width: 100,
                            height: 100,
                            decoration: const BoxDecoration(
                                color: Colors.red,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          );
                        } else {
                          return const Text('No Button tapped');
                        }
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ConvertUiCubit>().showtext();
                        },
                        child: Text('Show Text')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ConvertUiCubit>().showimage();
                        },
                        child: Text('Show image')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ConvertUiCubit>().showcircle();
                        },
                        child: Text('Show circle')),
                    ElevatedButton(
                        onPressed: () {
                          context.read<ConvertUiCubit>().reset();
                        },
                        child: Text('Reset')),
                  ]),
                ))));
  }
}
