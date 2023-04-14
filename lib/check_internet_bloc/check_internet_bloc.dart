import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'check_internet_event.dart';
part 'check_internet_state.dart';

class CheckInternetBloc extends Bloc<CheckInternetEvent, CheckInternetState> {
  late Connectivity _connectivity = Connectivity();
  CheckInternetBloc() : super(CheckInternetInitial()) {
    startMonitoring();
    on<InternetStatus>(_onCheckInternet);
  }

  Future<void> startMonitoring() async {
    var status = await initConnectivity();
    if (status) {
      add(InternetStatus(status));
    } else {
      add(InternetStatus(status));
    }
    _connectivity.onConnectivityChanged.listen((
      ConnectivityResult result,
    ) async {
      if (result == ConnectivityResult.none) {
        add(InternetStatus(false));
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          if (isConnected) {
            add(InternetStatus(true));
          } else {
            add(InternetStatus(false));
          }
        });
      }
    });
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected = false;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
        Fluttertoast.showToast(
            msg: "Wow!! Internet Connected",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } on SocketException catch (_) {
      isConnected = false;
    }
    return isConnected;
  }

  Future<bool> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        return false;
      } else {
        // Fluttertoast.showToast(
        //     msg: "Wow!! Internet Connected",
        //     toastLength: Toast.LENGTH_SHORT,
        //     gravity: ToastGravity.BOTTOM,
        //     timeInSecForIosWeb: 1,
        //     backgroundColor: Colors.green,
        //     textColor: Colors.white,
        //     fontSize: 16.0);
        return true;
      }
    } on PlatformException catch (e) {
      print("PlatformException: " + e.toString());
      return false;
    }
  }

  FutureOr<void> _onCheckInternet(
      InternetStatus event, Emitter<CheckInternetState> emit) {
    if (event.isOnline) {
      emit(InternetSuccessState());
    } else {
      emit(NoInternetStatus());
    }
  }
}
