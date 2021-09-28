import 'package:wishlist_demo/widgets/constant.dart';

class WishModel {
  String id;
  String title;
  String description;
  String type;
  String project;
  String expirationDate;
  List<String> assignedMember;
  String author;
  String currentState;

  WishModel({
    this.id = "",
    this.title = "",
    this.description = "",
    String? type,
    String? project,
    this.expirationDate = "",
    this.assignedMember = const [],
    this.author = "",
    String? currentState,
  })
  : type = type ?? dropdownType.first,
    project = type ?? dropdownProjects.first,
    currentState = currentState ?? "Nueva";

  @override
  String toString() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "type": type,
      "project": project,
      "expirationDate": expirationDate,
      "assignedMember": assignedMember,
      "author": author,
      "currentState": currentState,
    }.toString();
  }
}