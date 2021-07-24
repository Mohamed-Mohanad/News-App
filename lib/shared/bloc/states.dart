abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsScreenState extends NewsStates {}

class NewsRefreshLoadingState extends NewsStates {}

class NewsRefreshSuccessState extends NewsStates {}

class NewsRefreshErrorState extends NewsStates {
  final String error;

  NewsRefreshErrorState(this.error);
}

class NewsGetGeneralLoadingState extends NewsStates {}

class NewsGetGeneralSuccessState extends NewsStates {}

class NewsGetGeneralErrorState extends NewsStates {
  final String error;

  NewsGetGeneralErrorState(this.error);
}

class NewsGetBusinessLoadingState extends NewsStates {}

class NewsGetBusinessSuccessState extends NewsStates {}

class NewsGetBusinessErrorState extends NewsStates {
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsLoadingState extends NewsStates {}

class NewsGetSportsSuccessState extends NewsStates {}

class NewsGetSportsErrorState extends NewsStates {
  final String error;

  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceLoadingState extends NewsStates {}

class NewsGetScienceSuccessState extends NewsStates {}

class NewsGetScienceErrorState extends NewsStates {
  final String error;

  NewsGetScienceErrorState(this.error);
}

class NewsGetHealthLoadingState extends NewsStates {}

class NewsGetHealthSuccessState extends NewsStates {}

class NewsGetHealthErrorState extends NewsStates {
  final String error;

  NewsGetHealthErrorState(this.error);
}

class NewsGetTechnologyLoadingState extends NewsStates {}

class NewsGetTechnologySuccessState extends NewsStates {}

class NewsGetTechnologyErrorState extends NewsStates {
  final String error;

  NewsGetTechnologyErrorState(this.error);
}

class NewsGetEntertainmentLoadingState extends NewsStates {}

class NewsGetEntertainmentSuccessState extends NewsStates {}

class NewsGetEntertainmentErrorState extends NewsStates {
  final String error;

  NewsGetEntertainmentErrorState(this.error);
}

class NewsGetSearchLoadingState extends NewsStates {}

class NewsGetSearchSuccessState extends NewsStates {}

class NewsGetSearchErrorState extends NewsStates {
  final String error;

  NewsGetSearchErrorState(this.error);
}

class NewsAppChangeMode extends NewsStates {}
