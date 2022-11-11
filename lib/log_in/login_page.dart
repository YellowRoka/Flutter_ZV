import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:zv/log_in/parts/line_widget.dart';
import 'package:zv/log_in/parts/register_button.dart';

import 'bloc/login_bloc.dart';
import 'parts/head_background.dart';
import 'parts/login_button.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FormBuilder(
            child: Column(
              
              children: [
                const SizedBox( height: 20 ),
                const Text("Store App", style: TextStyle( fontSize: 46, color: Color.fromARGB( 255, 255, 255, 255) ) ),
                const SizedBox( height: 10 ),
                const SizedBox(
                  height: 480.0,
                  width:  500.0,
                  child:  HeadBackground(),
                ),

                const SizedBox( height: 10 ), const LineWidget( 'mail',    'mail', Icons.mail ),
                const SizedBox( height: 10 ), const LineWidget( 'password','pass', Icons.lock ),
                const SizedBox( height: 10 ), const LoginButton(),
                const SizedBox( height: 10 ), const RegisterButton(),
                
                BlocListener<LoginBloc, LoginState>(
                  child:     const SizedBox(height: 1),
                  listener: (context, state){ 
                    SnackBar snackBar;

                    if( (state is RegistResultState) &&
                        (state.props.isNotEmpty) &&
                        (state.props[0] == true))
                    {
                      snackBar = const SnackBar( content: Text('Registration done!'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

                    if( (state is RegistResultState) &&
                        (state.props.isNotEmpty) &&
                        (state.props[0] == false))
                    {
                      snackBar = const SnackBar( content: Text('Something went wrong...'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  
                }),

                
              ],
            ),
          ),
        ),
      ),
    );
  }

} 
