part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginInitialEvent extends LoginEvent {
  const LoginInitialEvent();

  @override
  List<Object> get props => [];
}

class LoginRQEvent extends LoginEvent {
  const LoginRQEvent(this.mail, this.pass);

  final String mail;
  final String pass;

  @override
  List<Object> get props => [mail,pass];

}

class RegistRQEvent extends LoginEvent {
  const RegistRQEvent(this.mail, this.pass);

  final String mail;
  final String pass;

  @override
  List<Object> get props => [mail,pass];
}
