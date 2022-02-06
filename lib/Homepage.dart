
import 'package:flutter/material.dart';
import 'package:my_internet_check/click.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("You are Connected with internet"),
          ),
          ElevatedButton(onPressed: (){
            print("its clicked");
            Navigator.push(context, MaterialPageRoute(builder: (context) => ClickedMe()));
          },
              child: Text("Click me")
          )
        ],
      ),
      
    );
  }
}