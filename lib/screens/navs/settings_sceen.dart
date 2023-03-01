import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rizaelwahid/bloc/counter_bloc/counter_bloc.dart';
import 'package:rizaelwahid/widgets/data_widget.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Counter myCounter = BlocProvider.of<Counter>(context);
    CounterBloc myCounter = context.read<CounterBloc>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.green,
                child: InkWell(
                  onTap: () {
                    myCounter.add(DecrementEvent());
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const DataWidget(),
              Material(
                color: Colors.green,
                child: InkWell(
                  onTap: () {
                    myCounter.add(const IncrementEvent());
                  },
                  child: const SizedBox(
                    height: 100,
                    width: 100,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
