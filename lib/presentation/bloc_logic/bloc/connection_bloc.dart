part of '../../../core/export.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final Connectivity _connectivity = Connectivity();
  late final StreamSubscription _connectivitySubscription;

  ConnectionBloc() : super(ConnectionInitial()) {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((result) {
      if (result.contains(ConnectivityResult.none)) {
        add(ConnectionLost());
      } else {
        add(ConnectionGained());
      }
    });

    on<ConnectionLost>((event, emit) => emit(ConnectionFailure()));
    on<ConnectionGained>((event, emit) => emit(ConnectionSuccess()));
  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}
