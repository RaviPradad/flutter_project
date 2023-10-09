import 'package:ravikpradad/model/person_model.dart';

class Room {
  int roomNumber;
  List<Person> adults;
  List<Person> children;

  Room({this.roomNumber = 0, this.adults = const [], this.children = const []});
}
