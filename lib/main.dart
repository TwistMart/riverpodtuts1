import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(
      child: MyApp())); // stores all the state of providers behind the seen
}

final nameProvider = Provider<String>((ref) {
  return "Hello I am martin who is";
});

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage2(),
    );
  }
}

class HomePage extends ConsumerWidget {
  // Consumer widget is used to access the state of data by used of Widget ref
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Riverpod Providerjjj"),
      ),
      body: Text(" $name doing riverpod test mmmm"),
    );
  }
}

class HomePage2 extends StatelessWidget {
  // Consumer widget is used to access the state of data by use of Widget ref
  HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Consumer(
        builder: (context, ref, child) {
          final name = ref.watch(nameProvider);
          return Text(
              "$name Consumer Provider , which is second way when widget is StatelessWidget");
        },
      )),
    );
  }
}

class HomePage3 extends ConsumerStatefulWidget {
  const HomePage3({Key? key}) : super(key: key); // Create a constructor

  @override
  // _HomePage3State createState() => _HomePage3State();

  ConsumerState<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends ConsumerState<HomePage3> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Center(child: Text("$name using ConsumerStatefulWidget in StatefulWidegt to read nameProvider ")),
    );
  }
}

 