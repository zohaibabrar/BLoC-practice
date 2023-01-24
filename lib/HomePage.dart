// ignore_for_file: prefer_const_constructors

import 'package:bloc_practice/bloc/internet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetConnectedState) {
              return Text('Connected!');
            } else if (state is InternetDisconnectedState) {
              return Text('Disconnected');
            } else {
              return Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}
