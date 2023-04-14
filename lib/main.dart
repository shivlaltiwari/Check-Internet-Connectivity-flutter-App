import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:my_internet_check/Homepage.dart';
import 'package:my_internet_check/check_internet_bloc/check_internet_bloc.dart';
import 'package:my_internet_check/no_internet_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CheckInternetBloc>(
      create: (context) => CheckInternetBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FirstPage(),
      ),
    );
  }
}

// ignore: must_be_immutable
class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    // context.read<CheckInternetBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckInternetBloc, CheckInternetState>(
      builder: (context, state) {
        if (state is InternetSuccessState) {
          return HomePage();
        } else if (state is NoInternetStatus) {
          return NoInternet();
        } else {
          return HomePage();
        }
      },
    );
    // return GetBuilder<CheckInternet>(
    //   init: CheckInternet(),
    //   builder: (internetController) {
    //     return internetController.isOnline! ? HomePage() : NoInternet();
    //   },
    // );
  }
}
