import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_demo/bloc/app/app_bloc.dart';
import 'package:wishlist_demo/bloc/wish/wish_bloc.dart';
import 'package:wishlist_demo/models/wish_model.dart';
import 'package:wishlist_demo/pages/add_wish_page.dart';
import 'package:wishlist_demo/pages/login_page.dart';
import 'package:wishlist_demo/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // final data = readJson();
    // print(data);
  }

  Future<dynamic> readJson() async {
    final String response = await rootBundle.loadString('assets/sample.json');
    final data = await json.decode(response);
    return data;
  }

  _createWish() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddWishPage()),
    );
  }

  _logout() {
    BlocProvider.of<AppBloc>(context).add(Logout());
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final String currentRole = BlocProvider.of<AppBloc>(context).state.userRole;
    final String currentUser = BlocProvider.of<AppBloc>(context).state.user;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Deseos"),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (value) {
                _logout();
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: "logout",
                    child: Text("Logout"),
                  )
                ];
              },
            ),
          ],
        ),
        body: BlocBuilder<WishBloc, WishState>(
          builder: (context, state) {
            List<WishModel> wishes = state.wishes;
            return SingleChildScrollView(
              child: SizedBox(
                width: size.width,
                child: Column(
                  children: currentRole == "developer"
                      ? wishes
                          .where((element) => element.assignedMember.contains(currentUser)).toList()
                          .map((wish) => WishCard(wish: wish))
                          .toList()
                      : wishes.map((wish) => WishCard(wish: wish)).toList(),
                ),
              ),
            );
          },
        ),
        floatingActionButton: currentRole == "manager"
            ? FloatingActionButton(
              onPressed: _createWish,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
            : null
    );
  }
}
