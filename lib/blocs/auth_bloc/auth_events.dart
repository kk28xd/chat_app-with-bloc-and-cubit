abstract class AuthEvents {}

class LoginUserEvent extends AuthEvents {
  final String email;
  final String password;

  LoginUserEvent({required this.email, required this.password});
}

class RegisterUserEvent extends AuthEvents {
  final String email;
  final String password;

  RegisterUserEvent({required this.email, required this.password});
}
