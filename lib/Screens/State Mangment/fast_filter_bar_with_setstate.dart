import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FastFilterBarWithSetState extends StatefulWidget {
  FastFilterBarWithSetState({super.key});

  @override
  State<FastFilterBarWithSetState> createState() =>
      _FastFilterBarWithSetStateState();
}

class _FastFilterBarWithSetStateState extends State<FastFilterBarWithSetState> {
  List name = ['تمت', 'تحت المراجعة', 'المكتملة', 'الملغية', 'قيد التنفيذ'];
  int _selectedButtonIndex = 0;

  Icon ic = const Icon(Icons.visibility_off, color: Colors.blue);
  bool pass = true;

  bool showText = true;
  String text = 'No Button Tapped';
  bool showImage = false;
  bool showCircle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Center(child: Text('Using_SetState'))),
        body: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                child: Column(children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        for (int i = 0; i < name.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedButtonIndex = i;
                                });
                              },
                              child: Container(
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: i == _selectedButtonIndex
                                        ? Colors.blue
                                        : const Color.fromARGB(
                                            255, 217, 217, 217),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(25))),
                                child: Center(
                                    child: Text(
                                  name[i],
                                  style: GoogleFonts.nunito(fontSize: 18),
                                )),
                              ),
                            ),
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                      ])),
                  const SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    obscureText: pass,
                    decoration: InputDecoration(
                        hintText: 'الرقم السري',
                        fillColor: Colors.white,
                        filled: true,
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.blue,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                pass = !pass;
                                if (pass == false) {
                                  ic = const Icon(Icons.visibility,
                                      color: Colors.blue);
                                } else {
                                  ic = const Icon(Icons.visibility_off,
                                      color: Colors.blue);
                                }
                              });
                            },
                            icon: ic),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (showText)
                    Text(text)
                  else if (showImage)
                    Image.network(
                      'https://pub.dev/packages/flutter_bloc/versions/8.1.3/gen-res/gen/190x190/logo.webp',
                      width: 100,
                      height: 100,
                    )
                  else if (showCircle)
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        text = 'We Are iTi_23';
                        showText = true;
                        showImage = false;
                        showCircle = false;
                      });
                    },
                    child: Text('Show Text'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showImage = true;
                        showCircle = false;
                        showText = false;
                      });
                    },
                    child: Text('Show Image'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showCircle = true;
                        showImage = false;
                        showText = false;
                      });
                    },
                    child: Text('Show Circle'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        text = 'No Button Tapped';
                        showCircle = false;
                        showImage = false;
                        showText = true;
                      });
                    },
                    child: Text('Reset'),
                  ),
                ]))));
  }
}
