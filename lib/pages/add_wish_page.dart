import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wishlist_demo/bloc/app/app_bloc.dart';
import 'package:wishlist_demo/bloc/wish/wish_bloc.dart';
import 'package:wishlist_demo/models/wish_model.dart';
import 'package:wishlist_demo/widgets/constant.dart';
import 'package:wishlist_demo/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

class AddWishPage extends StatefulWidget {

  const AddWishPage({Key? key}) : super(key: key);

  @override
  State<AddWishPage> createState() => _AddWishPageState();
}

class _AddWishPageState extends State<AddWishPage> {
  final formKey = GlobalKey<FormState>();
  var dateController = TextEditingController();
  WishModel wish = WishModel();

  _selectDate() async {
    FocusScope.of(context).requestFocus(FocusNode());
    DateTime selectedDate = DateTime.now().toLocal();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 30)));
    if (picked != null && picked != selectedDate) {
      setState(() {
        String date = "${selectedDate.toLocal()}".split(' ')[0];
        dateController.text = date;
        wish.expirationDate = date;
      });
    }
  }

  _addWish() {
    final form = formKey.currentState;
    if (form != null && form.validate()) {
      var uuid = const Uuid();
      wish.id = uuid.v1();
      wish.author = BlocProvider.of<AppBloc>(context).state.user;
      // print(wish.toString());
      BlocProvider.of<WishBloc>(context).add(AddWish(wish));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Deseo"),
      ),
      body: Center(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  RoundInput(
                    keyboardType: TextInputType.name,
                    hint: "Titulo",
                    icon: const Icon(Icons.title),
                    onChangedFunction: (value) => setState(() => wish.title = value),
                  ),
                  RoundInput(
                    keyboardType: TextInputType.multiline,
                    hint: "Descripcion",
                    icon: const Icon(Icons.description),
                    onChangedFunction: (value) => setState(() => wish.description = value),
                    maxLength: 150,
                  ),
                  RoundDropdown(
                    value: wish.type,
                    items: dropdownType,
                    onChanged: (value) => setState(() => wish.type = value),
                  ),
                  RoundDropdown(
                    value: wish.project,
                    items: dropdownProjects,
                    onChanged: (value) => setState(() => wish.project = value),
                  ),
                  RoundInput(
                    keyboardType: TextInputType.name,
                    hint: "Fecha de cumplimiento",
                    controller: dateController,
                    icon: const Icon(Icons.calendar_today),
                    onChangedFunction: (value) => setState(() => wish.expirationDate = value),
                    onTap: _selectDate,
                    maxLength: null,
                  ),
                  SizedBox(
                    width: size.width * 0.85,
                    child: ElevatedButton(
                      onPressed: _addWish,
                      child: const Text("Crear deseo"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
