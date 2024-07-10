import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:meta/meta.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _subscription;
  InternetCubit() : super(InternetInitial());

  // In Cubit we don't use events, So we need to replace events in functions
  void connected(){
    emit(ConnectedState(message: 'Connected'));
  }

  void notConnected(){
    emit(NotConnectedState(message: 'Not Connected'));
  }

  // We created it as in function here, but in bloc we put it inside it
  void checkConnection(){
    _subscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      if (results.any((result) => result == ConnectivityResult.wifi || result == ConnectivityResult.mobile)) {
        connected();
      } else {
        notConnected();
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}

