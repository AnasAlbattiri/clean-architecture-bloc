import 'package:clean_architecture/features/internet/presentation/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InternetPage extends StatefulWidget {
  const InternetPage({super.key});

  @override
  State<InternetPage> createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Internet'),
      ),
      body: BlocBuilder<InternetCubit, InternetState>(
        builder: (context, state) {
          if(state is ConnectedState){
            return _buildCenterText(state.message);
          } else if (state is NotConnectedState){
            return _buildCenterText(state.message);
          }
          return const SizedBox();
        },
      ),
    );
  }

  Center _buildCenterText(String message) {
    return Center(
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
