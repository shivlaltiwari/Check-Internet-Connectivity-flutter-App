import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("No internet"),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("You are not Connected with internet"),
          )
        ],
      ),
      
    );
  }
}