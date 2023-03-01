// import 'package:bloc_starter/bloc/backupcounter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizaelwahid/bloc/counter_bloc/counter_bloc.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    // CounterBloc myCounter = context.read<CounterBloc>();
    return BlocBuilder<CounterBloc, CounterState>(
      // bloc: myCounter,
      builder: (context, state) => Text(
        "${state.number}",
        style: const TextStyle(
          fontSize: 50,
          color: Colors.black,
        ),
      ),
    );
  }
}
