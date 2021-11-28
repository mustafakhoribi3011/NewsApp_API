import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/cubit/states.dart';
import 'package:news_application/network/remote/dio_helper.dart';
import 'package:news_application/shared/caching_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context) =>BlocProvider.of(context);
  bool toggled = false;
  String dropDownValue = 'Arabic';
  var dropDownList = ['Arabic','English','French','German'];
  bool isDark = false;

  void changeAppMode({bool fromShared})
  {
    if(fromShared != null)
      isDark = fromShared;
    else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
  void getDarkMode()
  {
    isDark =CacheHelper.getBoolean(key: 'isDark');
  }
  void dropDownItem(String value)
  {
    dropDownValue = value;
    emit(ChangeDropDownList());
  }

  List<dynamic> general =[];
  void getGeneral()
  {
    CacheHelper.getData(key: 'countryName');
    emit(NewsGetGeneralLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,
      query:
      {
        'country' : CacheHelper.getData(key: 'countryName'),
        'category' : 'general',
        'apiKey': 'da59a3b59240458fa0de06d4ed89e635'
      },
    ).then((value) {
      print(value.data.toString());
      general = value.data['articles'];
      emit(NewsGetGeneralSuccessState());
    }).catchError((error){
      emit(NewsGetGeneralErrorState(error.toString()));
      print(error.toString());
    });
  }
  List<dynamic> business =[];
  void getBusiness()
  {
    CacheHelper.getData(key: 'countryName');
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,
      query:
      {
        'country' :     CacheHelper.getData(key: 'countryName'),
        'category' : 'business',
        'apiKey': 'da59a3b59240458fa0de06d4ed89e635'
      },
    ).then((value) {
      print(value.data.toString());
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      emit(NewsGetBusinessErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> sports =[];

  void getSports()
  {
    CacheHelper.getData(key: 'countryName');
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,
      query:
      {        'country' :     CacheHelper.getData(key: 'countryName'),
        'category' : 'sports',
        'apiKey': 'da59a3b59240458fa0de06d4ed89e635'
      },
    ).then((value) {
      print(value.data.toString());
      sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error){
      emit(NewsGetSportsErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> health =[];

  void getHealth()
  {
    CacheHelper.getData(key: 'countryName');
    emit(NewsGetHealthLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,
      query:
      {
        'country' :     CacheHelper.getData(key: 'countryName'),
        'category' : 'health',
        'apiKey': 'da59a3b59240458fa0de06d4ed89e635'
      },
    ).then((value) {
      print(value.data.toString());
      health = value.data['articles'];
      emit(NewsGetHealthSuccessState());
    }).catchError((error){
      emit(NewsGetHealthErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> science =[];

  void getScience()
  {
    CacheHelper.getData(key: 'countryName');
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,
      query:
      {
        'country' :     CacheHelper.getData(key: 'countryName'),
        'category' : 'science',
        'apiKey': 'da59a3b59240458fa0de06d4ed89e635'
      },
    ).then((value) {
      print(value.data.toString());
      science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error){
      emit(NewsGetScienceErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> technology =[];

  void getTechnology()
  {
    CacheHelper.getData(key: 'countryName');
    emit(NewsGetTechnologyLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,
      query:
      {
        'country' :     CacheHelper.getData(key: 'countryName'),
        'category' : 'technology',
        'apiKey': 'da59a3b59240458fa0de06d4ed89e635'
      },
    ).then((value) {
      print(value.data.toString());
      technology = value.data['articles'];
      emit(NewsGetTechnologySuccessState());
    }).catchError((error){
      emit(NewsGetTechnologyErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> entertainment =[];

  void getEntertainment()
  {
    CacheHelper.getData(key: 'countryName');
    emit(NewsGetEntertainmentLoadingState());
    DioHelper.getData(url:'v2/top-headlines' ,
      query:
      {
        'country' :     CacheHelper.getData(key: 'countryName'),
        'category' : 'entertainment',
        'apiKey': 'da59a3b59240458fa0de06d4ed89e635'
      },
    ).then((value) {
      print(value.data.toString());
      entertainment = value.data['articles'];
      emit(NewsGetEntertainmentSuccessState());
    }).catchError((error){
      emit(NewsGetEntertainmentErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> search =[];
  void getSearch(String value)
  {
    CacheHelper.getData(key: 'countryName');
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(url:'v2/everything' ,
      query:
      {
      'q' : '$value',
        'apiKey': 'da59a3b59240458fa0de06d4ed89e635'
      },
    ).then((value) {
      print(value.data.toString());
      search = value.data['articles'];
      emit(NewsGetEntertainmentSuccessState());
    }).catchError((error){
      emit(NewsGetEntertainmentErrorState(error.toString()));
      print(error.toString());
    });
  }
}