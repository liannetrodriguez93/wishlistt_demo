part of 'widgets.dart';

class RoundInput extends StatelessWidget {
  final ValueSetter onChangedFunction;
  final TextInputType keyboardType;
  final String hint;
  final Icon? icon;
  final bool obscureText;
  final TextEditingController? controller;
  final GestureTapCallback? onTap;
  final int? maxLength;

  const RoundInput({
    Key? key,
    required this.keyboardType,
    required this.onChangedFunction,
    required this.hint,
    this.icon,
    this.obscureText = false,
    this.controller,
    this.onTap,
    this.maxLength = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: size.width * 0.85,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                  minLines: keyboardType == TextInputType.multiline ? 5 : 1,
                  maxLines: obscureText ? 1 : 5,
                  maxLength: maxLength,
                  autocorrect: false,
                  keyboardType: keyboardType,
                  cursorColor: primaryColor,
                  onChanged: onChangedFunction,
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint,
                    contentPadding: const EdgeInsets.only(left: 20, top: 20),
                    hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                    fillColor: Colors.white,
                    filled: true,
                    suffixIcon: icon,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    errorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(30)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: primaryColor),
                        borderRadius: BorderRadius.circular(30)),
                    errorMaxLines: 1,
                  ),
                  textAlign: TextAlign.left,
                  obscureText: obscureText,
                  onTap: onTap,
                  key: key),
            ),
          ),
        ],
      ),
    );
  }
}
