import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/screens/settings_screen/settings_screen.dart';
import 'package:news_application/shared/components/components.dart';
import'package:news_application/screens/search_screen/search_screen.dart';
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        return DefaultTabController(
          initialIndex: 0,
          length: 7,
          child: Scaffold(
            appBar: AppBar
              (centerTitle: true,
              title: Image.asset('assets/images/newshub.png',height: 26,),
              actions: [
                IconButton(
                  onPressed: ()
                  {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SearchScreen();
                  }));
                  },
                  icon:
                  ImageIcon(
                  AssetImage("assets/icons/search2.png"),
                  ),
                ),
                IconButton(onPressed: ()
                {
                  // NewsCubit.get(context).changeAppMode();
                  // // print(NewsCubit.get(context).isDark);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return  SettingsScreen();
                  }
                  ));
                },
                  icon:  ImageIcon(
                    AssetImage("assets/icons/settings.png"),
                  ),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(
                    icon:  ImageIcon(
                      AssetImage("assets/icons/newsss.png"),
                      size: 27,
                    ),
                    child: Text('General',style: TextStyle(fontSize: 14),),
                  ),
                  Tab(
                    icon:  ImageIcon(
                      AssetImage("assets/icons/business.png"),
                      size: 27,
                    ),
                    child: Text('Business',style: TextStyle(fontSize: 14),),
                  ),
                  Tab(
                    icon:  ImageIcon(
                      AssetImage("assets/icons/sport.png"),
                      size: 27,
                    ),
                    child: Text('Sports',style: TextStyle(fontSize: 14),),
                  ),
                  Tab(
                    icon:  ImageIcon(
                      AssetImage("assets/icons/hospital.png"),
                      size: 27,
                    ),
                    child: Text('Health',style: TextStyle(fontSize: 14),),
                  ),
                  Tab(
                    icon:  ImageIcon(
                      AssetImage("assets/icons/laboratory.png"),
                      size: 27,
                    ),
                    child: Text('Science',style: TextStyle(fontSize: 14),),
                  ),
                  Tab(
                    icon:  ImageIcon(
                      AssetImage("assets/icons/technology.png"),
                      size: 27,
                    ),
                    child: Text('Technology',style: TextStyle(fontSize: 14),),
                  ),
                  Tab(
                    icon:  ImageIcon(
                      AssetImage("assets/icons/entertainments.png"),
                      size: 27,
                    ),
                    child: Text('Entertainment',style: TextStyle(fontSize: 14),),
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                BlocProvider(
                  create: (BuildContext context) =>NewsCubit()..getGeneral(),
                  child: BlocConsumer<NewsCubit, NewsStates>(
                    listener: (context, state){},
                    builder: (context, state)
                    {
                      var list = NewsCubit.get(context).general;
                      return   ConditionalBuilder(
                        condition: state is! NewsGetGeneralLoadingState ,
                        builder: (context) =>ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder:(context, index) => buildArticleItem(list[index],context) ,
                          itemCount:list.length,
                        ),
                        fallback:(context) =>Center(child: CircularProgressIndicator()
                        ) ,
                      );
                    },
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => NewsCubit()..getBusiness(),
                  child: BlocConsumer<NewsCubit, NewsStates>(
                    listener: (context, state){},
                    builder: (context, state)
                    {
                      var list = NewsCubit.get(context).business;
                      return articleBuilder(list);
                    },
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => NewsCubit()..getSports(),
                  child: BlocConsumer<NewsCubit, NewsStates>(
                    listener: (context, state){},
                    builder: (context, state)
                    {
                      var list = NewsCubit.get(context).sports;
                      return articleBuilder(list);
                    },
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => NewsCubit()..getHealth(),
                  child: BlocConsumer<NewsCubit, NewsStates>(
                    listener: (context, state){},
                    builder: (context, state)
                    {
                      var list = NewsCubit.get(context).health;
                      return  articleBuilder(list);
                    },
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => NewsCubit()..getScience(),
                  child: BlocConsumer<NewsCubit, NewsStates>(
                    listener: (context, state){},
                    builder: (context, state)
                    {
                      var list = NewsCubit.get(context).science;
                      return   articleBuilder(list);
                    },
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => NewsCubit()..getTechnology(),
                  child: BlocConsumer<NewsCubit, NewsStates>(
                    listener: (context, state){},
                    builder: (context, state)
                    {
                      var list = NewsCubit.get(context).technology;
                      return  articleBuilder(list);
                    },
                  ),
                ),
                BlocProvider(
                  create: (BuildContext context) => NewsCubit()..getEntertainment(),
                  child: BlocConsumer<NewsCubit, NewsStates>(
                    listener: (context, state){},
                    builder: (context, state)
                    {
                      var list = NewsCubit.get(context).entertainment;
                      return  articleBuilder(list);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
  }
}
