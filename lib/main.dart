import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/cubit.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/network/remote/dio_helper.dart';
import 'package:news_application/screens/home_screen/home_screen.dart';
import 'package:news_application/shared/bloc_observer.dart';
import 'package:news_application/screens/splash/splash_screen.dart';
import 'package:news_application/shared/caching_helper.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  SystemUiOverlayStyle(
    statusBarColor: Colors.red,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getDarkMode(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            routes: {"HomeScreen":(_) => HomeScreen(),},
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.7
                ),
              ),
              primarySwatch: Colors.red,
              indicatorColor: Colors.red,
              tabBarTheme: TabBarTheme(
                labelColor: Colors.black,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(
                    color: Colors.black
                ),
                elevation: 3.0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark
                ),
                backgroundColor: Colors.white,
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.red,
                selectedLabelStyle: TextStyle(fontSize: 13.5),
                selectedIconTheme: IconThemeData(
                    color: Colors.red
                ),
              ),
            ),
            themeMode: NewsCubit.get(context).isDark ?ThemeMode.dark:ThemeMode.light,
            darkTheme: ThemeData(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              switchTheme: SwitchThemeData(
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  height: 1.7,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              primarySwatch: Colors.red,
              indicatorColor: Colors.red,
              cardColor: Colors.grey.shade900,
              appBarTheme: AppBarTheme(
                backwardsCompatibility: false,
                backgroundColor: Colors.grey.shade900,
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                ),
              ),
              scaffoldBackgroundColor: Colors.grey.shade900,
            ),
            home:SplashScreen(),
          );
        },
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
