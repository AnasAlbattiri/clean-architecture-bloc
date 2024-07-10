import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(IncrementEvent());
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            BlocProvider.of<CounterBloc>(context).add(ResetEvent());
          },
          child: const Icon(Icons.exposure_zero),
        ),
        const SizedBox(
          height: 10,
        ),
        FloatingActionButton(
          onPressed: () {
            // BlocProvider.of<CounterBloc>(context).add(DecrementEvent());
            context.read<CounterBloc>().add(DecrementEvent()); // this is the same
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}