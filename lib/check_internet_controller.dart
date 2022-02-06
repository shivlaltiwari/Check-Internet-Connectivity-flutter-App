

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CheckInternet extends GetxController{
  Connectivity _connectivity = new Connectivity();

  bool? isOnline = false;
  bool get isMeOnline => isOnline!;
  
   @override
  void onInit() {
    super.onInit();
    startMonitoring();
  }

  startMonitoring() async {
    await initConnectivity();
    _connectivity.onConnectivityChanged.listen((
      ConnectivityResult result,
    ) async {
      if (result == ConnectivityResult.none) {
        isOnline = false;
        update();
      } else {
        await _updateConnectionStatus().then((bool isConnected) {
          isOnline = isConnected;
          update();
        });
      }
    });
  }

  Future<void> initConnectivity() async {
    try {
      var status = await _connectivity.checkConnectivity();

      if (status == ConnectivityResult.none) {
        isOnline = false;
         update();
      } else {
        isOnline = true;
         update();
      }
    } on PlatformException catch (e) {
      print("PlatformException: " + e.toString());
    }
  }

  Future<bool> _updateConnectionStatus() async {
    bool isConnected = false;
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        isConnected = true;
      }
    } on SocketException catch (_) {
      isConnected = false;
      //return false;
    }
    return isConnected;
  }
}