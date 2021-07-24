import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/business_screen.dart';
import 'package:news_app/layouts/entertainment_screen.dart';
import 'package:news_app/layouts/general_screen.dart';
import 'package:news_app/layouts/health_screen.dart';
import 'package:news_app/layouts/science_screen.dart';
import 'package:news_app/layouts/sports_screen.dart';
import 'package:news_app/layouts/technology_screen.dart';
import 'package:news_app/network/cache_helper.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:news_app/shared/bloc/states.dart';
import 'package:news_app/shared/components/constants.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  String country = "eg";

  List<Widget> screens = [
    GeneralScreen(),
    SportsScreen(),
    BusinessScreen(),
    HealthScreen(),
    ScienceScreen(),
    TechnologyScreen(),
    EntertainmentScreen(),
  ];

  void changeScreenDrawer(int index) {
    currentIndex = index;
    switch (currentIndex) {
      case 0:
        getGeneral();
        emit(NewsScreenState());
        break;
      case 1:
        getSports();
        emit(NewsScreenState());
        break;
      case 2:
        getBusiness();
        emit(NewsScreenState());
        break;
      case 3:
        getHealth();
        emit(NewsScreenState());
        break;
      case 4:
        getScience();
        emit(NewsScreenState());
        break;
      case 5:
        getTechnology();
        emit(NewsScreenState());
        break;
      case 6:
        getEntertainment();
        emit(NewsScreenState());
        break;
      default:
        getGeneral();
        emit(NewsScreenState());
    }
  }


  List<dynamic> general = [];

  void getGeneral() {
    emit(NewsGetGeneralLoadingState());
    DioHelper.getData(
      url: '${Api.url}',
      query: {
        'country': '$country',
        'category': 'general',
        'apiKey': '${Api.apiKey}',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      general = value.data['articles'];

      emit(NewsGetGeneralSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetGeneralErrorState(error.toString()));
    });
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: '${Api.url}',
      query: {
        'country': '$country',
        'category': 'business',
        'apiKey': '${Api.apiKey}',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business = value.data['articles'];

      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: '${Api.url}',
      query: {
        'country': '$country',
        'category': 'sports',
        'apiKey': '${Api.apiKey}',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      sports = value.data['articles'];

      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: '${Api.url}',
      query: {
        'country': '$country',
        'category': 'science',
        'apiKey': '${Api.apiKey}',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      science = value.data['articles'];

      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> health = [];

  void getHealth() {
    emit(NewsGetHealthLoadingState());
    DioHelper.getData(
      url: '${Api.url}',
      query: {
        'country': '$country',
        'category': 'health',
        'apiKey': '${Api.apiKey}',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      health = value.data['articles'];

      emit(NewsGetHealthSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetHealthErrorState(error.toString()));
    });
  }

  List<dynamic> technology = [];

  void getTechnology() {
    emit(NewsGetTechnologyLoadingState());
    DioHelper.getData(
      url: '${Api.url}',
      query: {
        'country': '$country',
        'category': 'technology',
        'apiKey': '${Api.apiKey}',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      technology = value.data['articles'];

      emit(NewsGetTechnologyLoadingState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetTechnologyErrorState(error.toString()));
    });
  }

  List<dynamic> entertainment = [];

  void getEntertainment() {
    emit(NewsGetEntertainmentLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': '${Api.url}',
        'category': 'entertainment',
        'apiKey': '${Api.apiKey}',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      entertainment = value.data['articles'];

      emit(NewsGetEntertainmentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetEntertainmentErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    search = [];

    DioHelper.getData(
      url: '${Api.url}',
      query: {
        'q': '$value',
        'apiKey': '${Api.apiKey}',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsAppChangeMode());
    } else {
      isDark = !isDark;
      CacheHelper.putBooleanData(key: 'isDark', value: isDark).then((value) {
        emit(NewsAppChangeMode());
      });
    }
  }

}
