import 'package:flutter/material.dart';

class FunnyContainer extends StatelessWidget {
  const FunnyContainer({Key? key}) : super(key: key);

  Widget _childContainer() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.yellow,
            width: 4,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
    child: Container(
    height: 400,
    decoration: const BoxDecoration(
    color: Colors.black,
    borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: Stack(
    children: [
    Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    const SizedBox(height: 40),
    Expanded(child: _childContainer()),
      Expanded(child: _childContainer()),
      Expanded(child: _childContainer()),
    ],
    ),
      const Positioned(
        left: 0,
        right: 0,
        top: -10,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 40,
        ),
      )
    ],
    ),
    ),
        ),
    );
  }
}