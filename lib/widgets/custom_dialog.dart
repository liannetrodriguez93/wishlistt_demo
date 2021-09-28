part of 'widgets.dart';

class CustomDialog extends StatefulWidget {
  final WishModel wish;
  final List<String> data;
  final String title;
  final String buttonText;

  const CustomDialog(
      {Key? key,
      required this.wish,
      required this.data,
      required this.title,
      required this.buttonText})
      : super(key: key);

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  final _formKey = GlobalKey<FormState>();
  late String dropdownValue;

  @override
  void initState() {
    super.initState();
    if (widget.buttonText == "Asignar") {
      dropdownValue = widget.data.first;
    } else {
      dropdownValue =
          widget.wish.currentState == "Nueva" ? widget.data.first : widget.wish.currentState;
    }
  }

  _assignMember() {
    WishModel newWish = widget.wish;
    newWish.assignedMember = [...newWish.assignedMember, dropdownValue];
    BlocProvider.of<WishBloc>(context).add(UpdateWishState(newWish));
    Navigator.pop(context);
  }

  _changingState() {
    WishModel newWish = widget.wish;
    newWish.currentState = dropdownValue;
    BlocProvider.of<WishBloc>(context).add(UpdateWishState(newWish));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Color(0xFF2094AD),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
                RoundDropdown(
                  value: dropdownValue,
                  items: widget.data,
                  onChanged: (value) => setState(() => dropdownValue = value),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text(widget.buttonText),
                    onPressed: widget.buttonText == "Asignar" ? _assignMember : _changingState,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
