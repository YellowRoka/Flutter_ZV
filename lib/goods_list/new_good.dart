import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../fire_base/data_model.dart';
import 'bloc/goods_bloc.dart';

class NewGoods extends StatelessWidget{
  const NewGoods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FormBuilder(
      child: Wrap(
        children: [

          const Center(child: Text('Add New Goods',style: TextStyle(fontSize: 24, fontStyle: FontStyle.italic) )),

          inputDataLine( name: 'Goods', icon: Icons.add_shopping_cart_sharp),
          inputDataLine( name: 'Count', icon: Icons.add_chart),
          inputDataLine( name: 'Shop',  icon: Icons.add_business_outlined),
          
          validateButton( name: 'Add' ),     
        ]
      ),
    );
  }

  Builder validateButton( { required String name } ){
    return Builder(
          builder: ( context ){
            return DialogButton(
              child:     Text( name, style: const TextStyle( color: Colors.white, fontSize: 20 ) ),
              color:   const Color.fromARGB( 206, 57, 151, 28 ),
              onPressed: () {
                var form = FormBuilder.of( context );

                if( form!.saveAndValidate() ){                
                  GoodsData newGood = GoodsData(
                    Random().nextInt(31),
                    form.value[ 'Goods' ],
                    form.value[ 'Count' ],
                    form.value[ 'Shop'  ],
                    false
                  );
                  
                  BlocProvider.of<GoodsBloc>(context).add(GoodsEventAdd(newGood));
                  Navigator.pop(context);  
                }
              },
            );
          }
        );
  }

  FormBuilderTextField inputDataLine( { required String name, required IconData icon } ){
    return FormBuilderTextField(
          name:       name,
          validator:  (value){ return valid(value); },
          decoration:  InputDecoration(
            icon:      Icon(icon),
            labelText: name,
            ),
        );
  }

  String? valid(String? value) {
    if( value == null || value.isEmpty ) {
        return 'Please enter some text';
      }
    return null;
  }

}
