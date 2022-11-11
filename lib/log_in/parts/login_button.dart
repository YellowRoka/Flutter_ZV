import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../bloc/login_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child:     Builder(
      builder:   (context) => SizedBox(
        width: 100,
        child: ElevatedButton(
          //style:   TextButton.styleFrom(backgroundColor: Colors.deepPurple.shade900, primary: Colors.white),
          child:     const Text('LOGIN'),
          onPressed: () {
            var form = FormBuilder.of(context)!;

            if(form.saveAndValidate()){
                String mail = form.value['mail'];
                String pass = form.value['pass'];

                BlocProvider.of<LoginBloc>( context ).add( LoginRQEvent( mail, pass ) );
            }
          }),
        ),
      ),
    );
  }
}
