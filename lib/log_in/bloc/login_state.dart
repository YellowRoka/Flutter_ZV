part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {
  const LoginInitialState();
  
  @override
  List<Object> get props => [];
}

class LoginResultState extends LoginState{
  final bool result;

  const LoginResultState(this.result);

  @override
  List<Object> get props => [result];
  
}

class RegistResultState extends LoginState{
  final bool result;

  const RegistResultState(this.result);

   @override
   List<Object> get props => [result];
}
