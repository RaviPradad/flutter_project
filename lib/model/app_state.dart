import 'package:ravikpradad/model/room_model.dart';

class AppState {
  final List<Room> room;
  AppState(this.room);
  AppState.initialState() : room = const [];
}
