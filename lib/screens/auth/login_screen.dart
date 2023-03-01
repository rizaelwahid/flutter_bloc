import 'package:rizaelwahid/bloc/auth_bloc/auth_bloc.dart';
import 'package:rizaelwahid/bloc/login_bloc/login_bloc.dart';
import 'package:rizaelwahid/repositories/repositories.dart';
import 'package:rizaelwahid/screens/auth/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;
  const LoginScreen({Key? key, required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(userRepository: userRepository),
      ),
    );
  }
}
