import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_demo/bloc/app/app_bloc.dart';
import 'package:wishlist_demo/pages/home_page.dart';
import 'package:wishlist_demo/widgets/constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> logIn(List<String> userData) async {
    AppBloc appBloc = BlocProvider.of<AppBloc>(context);
    appBloc.add(Login());
    await Future.delayed(const Duration(seconds: 2), () {});
    appBloc.add(Logged(user: userData[0], userRole: userData[1]));
    Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: BlocBuilder<AppBloc, AppState>(
          builder: (BuildContext context, state) {
            if(!state.isLoading && !state.isLogged) {
              return SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: users.map(
                        (user) => SizedBox(
                      width: size.width * 0.85,
                      child: ElevatedButton(
                        onPressed: () {
                          logIn(user);
                        },
                        child: Text("Iniciar como " + user[0]),
                      ),
                    ),
                  ).toList(),
                ),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }

        )
    );
  }
}
