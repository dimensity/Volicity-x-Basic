import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:volicityx_counter_02/my_store.dart';

void main() {
  runApp(
    VxState(
      store: MyStore(),
      child: MyApp(),
    ),
  );
}

class AddMutation extends VxMutation<MyStore> {
  @override
  perform() {
    store!.counter++;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('******** Build Method Called ********');
    MyStore myStore = VxState.store;
    VxState.watch(context, on: [AddMutation]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter: ${myStore.counter}'),
              ElevatedButton(
                onPressed: () {
                  AddMutation();
                },
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
