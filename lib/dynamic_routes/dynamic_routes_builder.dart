  import 'package:flutter/material.dart';

import '../goods_list/goods_list_page.dart';

PageRouteBuilder<dynamic> animatedMaterialPageRoute(RouteSettings settings) {
  return PageRouteBuilder(
    settings:           settings,
    pageBuilder:        (context, animation, secundaryAnimation) => const GoodsPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeIn;
      var tween =
          Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  
  );
}
