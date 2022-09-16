part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// Cuando el usuario se registra con el correo electrónico y la contraseña se llama a este evento y se llama al [AuthRepository] para registrar al usuario
class SignInRequested extends AuthEvent {
  final String email;
  final String password;

  SignInRequested(this.email, this.password);
}

// Cuando el usuario se da de baja se llama a este evento y se llama al [AuthRepository] para dar de baja al usuario
class SignOutRequested extends AuthEvent {}
