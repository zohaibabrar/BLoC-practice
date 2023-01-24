// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  Connectivity _connectivity = Connectivity();
  StreamSubscription? streamSubscription;

  InternetBloc() : super(InternetInitial()) {
    on<InternetConnectedEvent>((event, emit) => emit(InternetConnectedState()));
    on<InternetDisconnectedEvent>(
        (event, emit) => emit(InternetDisconnectedState()));

    streamSubscription = _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        add(InternetConnectedEvent());
      } else {
        add(InternetDisconnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
