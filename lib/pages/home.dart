import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_one/local_store/storage.dart';

import '../bloc/counter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    StorageFunc.initializePreference().whenComplete(() async {
      BlocProvider.of<CounterBloc>(context).add(CounterTrigger());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterLoaded) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${state.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            }
            return Container();
          },
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, '/next');
              },
              tooltip: 'Increment',
              heroTag: "next_page",
              label: const Text("NEXT PAGE"),
              icon: const Icon(Icons.skip_next_rounded),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(CounterInc());
              },
              heroTag: "add1",
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(CounterDec());
              },
              heroTag: "sub1",
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
