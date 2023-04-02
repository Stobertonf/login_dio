

import 'package:flutter/material.dart';

class RandomNumbers extends StatefulWidget {
  const RandomNumbers({super.key});

  @override
  State<RandomNumbers> createState() => _RandomNumbersState();
}

class _RandomNumbersState extends State<RandomNumbers> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          width: 100,
          height: 100,
          color: Colors.red,
        ),),
    );
  }
}