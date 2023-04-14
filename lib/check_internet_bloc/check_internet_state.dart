part of 'check_internet_bloc.dart';

@immutable
abstract class CheckInternetState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckInternetInitial extends CheckInternetState {}

class InternetSuccessState extends CheckInternetState {}

class NoInternetStatus extends CheckInternetState {}
