import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/network/remote/dio_helper.dart';

import 'home_screen/home_screen.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getGeneral(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state)
        {
          var cubit = NewsCubit.get(context);
          return DefaultTabController(
            initialIndex: 1,
            length: 7,
            child: Scaffold(
              body: HomeScreen(),
            ),
          );
        },
      ),
    );
  }
}
