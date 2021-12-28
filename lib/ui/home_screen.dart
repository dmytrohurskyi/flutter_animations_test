import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late bool _isSelected = false;
  double _paddingValue = 4.0;
  double _animContainerHeight = 100;
  double _animContainerWidth = 100;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);
  Color _animContainerColor = Colors.purpleAccent;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedBuilder(
            animation: _controller,
            child: Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 50),
              child: Container(
                height: 100,
                width: 200,
                color: Colors.redAccent,
              ),
            ),
            builder: (BuildContext context, Widget? child) {
              return Transform.rotate(
                angle: _controller.value * 2.0 * 3.14,
                child: child,
              );
            },
          ),
          AnimatedDefaultTextStyle(
            child: Text('Sigma Software'),
            style: _isSelected
                ? TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink[600])
                : TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blueGrey[400]),
            duration: Duration(seconds: 1),
          ),
          AnimatedPadding(
            padding: EdgeInsets.all(_paddingValue),
            duration: Duration(seconds: 1),
            curve: Curves.ease,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: _animContainerHeight,
              width: _animContainerWidth,
              decoration: BoxDecoration(
                  borderRadius: _borderRadius, color: _animContainerColor),
            ),
          ),
          AnimatedPadding(
            padding: EdgeInsets.all(_paddingValue),
            duration: Duration(seconds: 1),
            curve: Curves.ease,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: _animContainerHeight + 33,
              width: _animContainerWidth + 15,
              decoration: BoxDecoration(
                  borderRadius: _borderRadius * 1.1, color: _animContainerColor),
            ),
          ),
          OutlinedButton(
            onPressed: () => setState(() {
              _isSelected = !_isSelected;
              _paddingValue = Random().nextInt(35).toDouble();
              _animContainerHeight = Random().nextInt(150).toDouble();
              _animContainerWidth = Random().nextInt(250).toDouble();

              _borderRadius =
                  BorderRadius.circular(Random().nextInt(50).toDouble());

              _animContainerColor = Color.fromRGBO(Random().nextInt(256),
                  Random().nextInt(256), Random().nextInt(256), 1);
            }),
            child: const Text(
              'PRESS ME to animate',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
