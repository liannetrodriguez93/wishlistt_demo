part of 'widgets.dart';

class WishCard extends StatelessWidget {
  final WishModel wish;

  const WishCard({Key? key, required this.wish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    const space = SizedBox(height: 10);
    final String currentRole = BlocProvider.of<AppBloc>(context).state.userRole;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(15),
      color: const Color(0xFF84CEE7),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: SizedBox(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                width: size.width,
                child: Text(
                  wish.title.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              space,
              SizedBox(
                width: size.width,
                child: Text(
                  wish.description,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 18,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Autor: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    wish.author,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Tipo de proyecto: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    wish.type,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              space,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Proyecto: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    wish.project,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              space,
              if (wish.assignedMember.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Desarrollador: ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      wish.assignedMember.join(", "),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                space,
              ],
              if (wish.currentState != "") ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Estado Actual: ",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    Text(
                      wish.currentState,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                space,
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Fecha de cuplimiento: ",
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Text(
                    wish.expirationDate,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
              space,
              SizedBox(
                width: size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    if (currentRole == "groupManager") ...[
                      TextButton(
                        onPressed: () {
                            List<String> usersData = users.where((user) => user[1] == "developer").toList()
                                .map((e) => e.first)
                                .toList();
                            for(var element in wish.assignedMember) {
                              usersData.removeWhere((item) => item == element);
                            }
                            showDialog(
                              context: context,
                              builder: (context) => CustomDialog(
                                wish: wish,
                                data: usersData,
                                title: "Asignar Deseo",
                                buttonText: "Asignar",
                                )
                            );
                        },
                        child: const Text('Asignar a... '),
                        style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: const Color(0xFF2094AD),
                        textStyle: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                        ),
                    ],
                    if (currentRole == "developer") ...[
                      TextButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (context) => CustomDialog(
                              wish: wish,
                              data: const ["Inciar", "En proceso", "Cerrada"],
                              title: "Cambiar Estado",
                              buttonText: "Cambiar",
                            )),
                        child: const Text('Cambiar estado'),
                        style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: const Color(0xFF2094AD),
                            textStyle: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
                      )
                    ],
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
