part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppGetUserLoadingState extends AppState {}

class AppGetUserSuccessState extends AppState {}

class AppGetUserErrorState extends AppState {
  final String error;

  AppGetUserErrorState(this.error);
}

class AppChangeBottomNavState extends AppState {}

class GetPricesSuccessState extends AppState {}

class GetPricesErrorState extends AppState {
  final String error;

  GetPricesErrorState(this.error);
}
