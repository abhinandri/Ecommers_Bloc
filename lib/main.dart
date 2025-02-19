import 'package:ecommers/controllers/api/login_api.dart';
import 'package:ecommers/controllers/api/products_api.dart';
import 'package:ecommers/controllers/blocs/bloc/bottom_nav/bloc/bottom_nav_bloc.dart';
import 'package:ecommers/controllers/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:ecommers/controllers/blocs/login_bloc/login_bloc.dart';
import 'package:ecommers/controllers/blocs/products_bloc/bloc/products_bloc.dart';
import 'package:ecommers/controllers/blocs/splash_bloc/bloc/splash_bloc.dart';
import 'package:ecommers/view/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashBloc()),
        BlocProvider(
            create: (context) => LoginBloc(authRepository: AuthRepository())),
        BlocProvider(create: (context) => BottomNavBloc()),
        BlocProvider<ProductsBloc>(create: (context)=>ProductsBloc(ApiService())..add(FetchProducts())),
        BlocProvider(create: (context)=>CartBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Splash(),
      ),
    );
  }
}
