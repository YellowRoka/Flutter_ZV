import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/goods_bloc.dart';
import 'new_good.dart';
import 'parts/goods_list.dart';

class GoodsPage extends StatelessWidget {
  const GoodsPage({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){
    return Scaffold(
      body: BlocBuilder< GoodsBloc, GoodsState >(
        builder: ( context, state ){
          return const GoodsList();
        },
      ),
      floatingActionButton: fab( context ),
    );
  }

  FloatingActionButton fab( BuildContext context ){
    return FloatingActionButton(
      backgroundColor: Colors.white,
      
      child: const Icon( 
        Icons.add_business_rounded,
        color: Color.fromARGB(206, 57, 151, 28)),
      
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(content: NewGoods());
          },
        );
      },
    );
  }
}
