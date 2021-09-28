import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_demo/bloc/app/app_bloc.dart';
import 'package:wishlist_demo/bloc/wish/wish_bloc.dart';
import 'package:wishlist_demo/pages/login_page.dart';
import 'package:wishlist_demo/widgets/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppBloc(),),
        BlocProvider(create: (_) => WishBloc(),)
      ],
      child: MaterialApp(
        title: 'Wishlist Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.

          // Define the default brightness and colors.
          brightness: Brightness.light,
          primarySwatch: materialColor,
        ),
        home: const LoginPage(),
      ),
    );
  }
}