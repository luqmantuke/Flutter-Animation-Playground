import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations_themes_custom_painter/widgets/custom_text.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({Key? key}) : super(key: key);

  @override
  _TweenAnimationExampleState createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample> {
  var _angle = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Transform Widget', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              duration: Duration(milliseconds: 400),
              tween: Tween(begin: 1, end: _angle),
              builder: (context, value, child) {
                return Transform.scale(scale: value, child: child);
              },
              child: CustomText('🍑', size: 120),
            ),
            SizedBox(
              height: 20,
            ),
            Slider.adaptive(
                value: _angle,
                max: 5.0,
                min: 1.0,
                onChanged: (value) {
                  setState(() {
                    _angle = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
