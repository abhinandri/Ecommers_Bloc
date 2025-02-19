import 'package:ecommers/controllers/blocs/splash_bloc/bloc/splash_bloc.dart';
import 'package:ecommers/view/login.dart';
import 'package:ecommers/view/screens/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(StartSplashEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Bottom_Nav()));
          } else if (state is SplashNavigateToLogin) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        },
        child: Scaffold(
          body: Center(
            child: Text('welcomeeeeeeeeeeeeeeeeeeee'),
          ),
        ),
      ),
    );
  }
}
