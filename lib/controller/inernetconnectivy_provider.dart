
import 'dart:async';
import 'package:firebase_wk1/services/connectivity/internet.dart';
import 'package:flutter/cupertino.dart';

class InternetConnectivityProvider extends ChangeNotifier {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  final InternetConnectivityServices _connectivityServices =
      InternetConnectivityServices();

  Future getInternetConnectivity(BuildContext context) async {
    _connectivityServices.getConnectivity(context); 
     isDeviceConnected=_connectivityServices .isDeviceConnected;
     isAlertSet=_connectivityServices.isAlertSet;
     subscription=_connectivityServices.subscription;
     
    
  }
  @override
  notifyListeners();
}