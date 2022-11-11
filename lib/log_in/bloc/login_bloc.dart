import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:zv/fire_base/authentication/authentication_data_source.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  //final AuthenticationDataSource authenticationDataSource;
  AuthenticationDataSource autDataSource = AuthenticationDataSource();

  LoginBloc() : super(const LoginInitialState()) {

    on<LoginInitialEvent>((event, emit) {
      emit(const LoginInitialState());
    });

    on<LoginRQEvent>((event, emit) async {
      try{
        await autDataSource.signIn(event.mail,event.pass);
        emit(const LoginResultState(true));
      }
      catch(e){
        emit(const LoginResultState(false));
      }
      emit(const LoginInitialState());
    });

    on<RegistRQEvent>((event, emit) async {
      try{
        await autDataSource.regist(event.mail,event.pass);
        emit(const RegistResultState(true));
      }
      catch(e){
        emit(const RegistResultState(false));
      }
      emit(const LoginInitialState());
    });
  }


  @override
  void onEvent(LoginEvent event) {
    print("selected on login Bloc: $event");
    super.onEvent(event);
  }
}
