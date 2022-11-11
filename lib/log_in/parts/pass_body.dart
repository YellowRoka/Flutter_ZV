import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PassBody extends StatelessWidget {
  final String  id;
  final String  hint;
  final String? initText;
  
  const PassBody( this.id, this.hint, this.initText, {Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController( text: initText );
    
    return FormBuilderTextField(
      controller:         controller,
      name:               id,
      obscureText:        true,
      obscuringCharacter: "*",

      decoration: InputDecoration(
        hintText:  hint,
        border:    InputBorder.none,
      )
    );
  }
}
