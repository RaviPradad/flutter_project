import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ravikpradad/model/app_state.dart';
import 'package:ravikpradad/reducer/app_reducer.dart';
import 'package:ravikpradad/screens/home.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final store = Store(
    reducer,
    initialState: AppState.initialState(),
  );
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Room',
        theme: ThemeData(
            // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            // useMaterial3: true,
            ),
        home: Home(),
      ),
    );
  }
}
