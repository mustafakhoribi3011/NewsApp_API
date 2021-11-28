
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/screens/home_screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
    {
      return HomeScreen();
    })));
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: NewsCubit.get(context).isDark?Colors.grey.shade900:Colors.white,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset('assets/images/logo1.png',
                  height: height*0.85,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
