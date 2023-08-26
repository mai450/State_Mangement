import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Test> {
  bool showText = true;
  String text = 'No Button Tapped';
  bool showImage = false;
  bool showCircle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.red),
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
              child: Text('Show text'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showImage = true;
                  showCircle = false;
                  showText = false;
                });
              },
              child: Text('Show image'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showCircle = true;
                  showImage = false;
                  showText = false;
                });
              },
              child: Text('Show circle'),
            ),
          ],
        ),
      ),
    );
  }
}
