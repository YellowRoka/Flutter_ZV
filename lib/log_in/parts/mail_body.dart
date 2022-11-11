import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class MailBody extends StatelessWidget {
  final String  id;
  final String  hint;
  final String? initText;

  const MailBody( this.id,this.hint, this.initText, {Key? key} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController( text: initText );

    return FormBuilderTextField(
      controller: controller,
      name:       id,
      decoration: InputDecoration(
        hintText:  hint,
        border:    InputBorder.none,
      )
    );
  }
}
