import 'package:ravikpradad/model/app_state.dart';

import '../action/app_action.dart';
import '../model/room_model.dart';

AppState reducer(AppState prev, dynamic action) {
  print("ACTION");
  if (action is RoomDetailAction) {
    // print("ACTION1${action.room.roomNumber}");
    final List<Room> roomList = [...prev.room];
    int index = roomList
        .indexWhere((element) => element.roomNumber == action.room.roomNumber);

    if (index != -1) {
      roomList[index].children.addAll(action.room.children);
      roomList[index].adults.addAll(action.room.adults);
    } else {
      roomList.add(action.room);
    }

    return AppState(roomList);
  } else {
    return prev;
  }
}
