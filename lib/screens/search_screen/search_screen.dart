import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/shared/components/components.dart';
class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  style: TextStyle(
                    color: NewsCubit.get(context).isDark?Colors.white:Colors.black
                  ),
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: NewsCubit.get(context).isDark?Colors.white:Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      color: NewsCubit.get(context).isDark?Colors.white:Colors.black,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color: NewsCubit.get(context).isDark?Colors.white:Colors.black,
                    ),
                    // border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(20)
                    // ),
                  ),
                  cursorColor: NewsCubit.get(context).isDark?Colors.white:Colors.black,
                  onChanged: (String value)
                  {
                    NewsCubit.get(context).getSearch(value);
                  },
                ),
              ),
              Expanded(child: articleBuilder(list)),
            ],
          ),
        );
      },
    );
  }
}