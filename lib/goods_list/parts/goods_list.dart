import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../fire_base/data_model.dart';
import '../bloc/goods_bloc.dart';

class GoodsList extends StatelessWidget {
  const GoodsList({Key? key}) : super(key: key);

  @override
  Widget build( BuildContext context ){

    BlocProvider.of< GoodsBloc >( context ).add( const GoodsEventLoad() );

    return BlocBuilder<GoodsBloc, GoodsState>(
      buildWhen: ( previous, current ) => 
        current is GoodsStateLoaded  || 
        current is GoodsStateLoading ||
        current is GoodsStateAdded   ||
        current is GoodsdStateRemoved,
      builder: ( context, state ){

        if( state is GoodsStateLoading ){
          return const Center( child: CircularProgressIndicator());
        }

        else if( state is GoodsStateLoaded ){ 
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
              child: Column(
                children: [ 
                  for( var it in state.goodsList ) ...[ dataCard(it) ] 
                  ],
              ),
            ),
          );
        }
        
        else{
          BlocProvider.of< GoodsBloc >( context ).add( const GoodsEventLoad() );
          return const Center( 
            child: CircularProgressIndicator()
          );
        }
      }
    );
  }

  Widget dataCard( GoodsData? goods ){
    return SizedBox(
      width: 600,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all( 8.0 ),
          child: Column(
            children: [
              dataLine(name: goods?.goods, icon: Icons.shopping_cart_sharp     ), const SizedBox( height: 8 ),
              dataLine(name: goods?.count, icon: Icons.bar_chart_sharp         ), const SizedBox( height: 8 ),
              dataLine(name: goods?.shop,  icon: Icons.account_balance_outlined), const SizedBox( height: 8 ),

              boughtedButton(goods, name: 'Done'),
            ],
          ),
        ),
      ),
    );
  }

  Widget boughtedButton( GoodsData? goods, { required String name } ){
    return Builder(
      builder: ( context ){
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              width: 62,
              height: 42,
              child: DialogButton(
                color:   const Color.fromARGB( 206, 57, 151, 28),
                onPressed: () => BlocProvider.of<GoodsBloc>( context ).add(GoodsEventRemove( goods ) ),
                child:     Text(
                  name,
                  style: const TextStyle( color: Colors.white, fontSize: 12 )
                ),
              ),
            ),
          ],
        );
      }
    );
  }

  Widget dataLine({required String? name, required IconData icon}) {
    return Row(
      children: [
        Icon(icon), 
        const SizedBox(width: 16), 
        Text(name ?? "empthy")
      ]
    );
  }

}
