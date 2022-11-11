import 'package:flutter/material.dart';

class HeadBackground extends StatelessWidget {
  const HeadBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0),
      child:        SizedBox.fromSize(
        //size: Size.fromRadius(48),
        child: Image.asset('assets/images/shop.jpg',fit: BoxFit.cover),
      ),
    );
  }
}
