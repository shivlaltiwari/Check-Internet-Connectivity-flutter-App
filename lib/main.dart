import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_internet_check/Homepage.dart';
import 'package:my_internet_check/check_internet_controller.dart';
import 'package:my_internet_check/no_internet_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:FirstPage() ,
    );
  }
}
// ignore: must_be_immutable
class FirstPage extends StatelessWidget {
   FirstPage({ Key? key }) : super(key: key);
  CheckInternet checkInternet = Get.put(CheckInternet());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckInternet>(
      init: CheckInternet(),
      builder: (internetController){
        return internetController.isOnline! ? HomePage(): NoInternet();
      },
      );
  }
}


