part of 'widgets.dart';

class RoundDropdown extends StatelessWidget {
  final ValueSetter onChanged;
  final int minLines;
  final int maxLines;
  final Function? validator;
  final String value;
  final List<String> items;

  const RoundDropdown(
      {Key? key,
      required this.onChanged,
      required this.value,
      required this.items,
      this.minLines = 1,
      this.maxLines = 1,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    return SizedBox(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * 0.85,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: DropdownButtonFormField(
                isExpanded: true,
                menuMaxHeight: size.height * 0.18,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20, top: 20, right: 15),
                  hintStyle: TextStyle(color: primaryColor, fontSize: 15),
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(30)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(30)),
                  errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(30)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(30)),
                  errorMaxLines: 1,
                  counterText: '',
                ),
                value: value,
                items: items.map((element) {
                  return DropdownMenuItem(
                    child: Text(element),
                    value: element,
                  );
                }).toList(),
                onChanged: onChanged,
                validator: (value) {
                  if (validator != null) return validator!(value);
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
