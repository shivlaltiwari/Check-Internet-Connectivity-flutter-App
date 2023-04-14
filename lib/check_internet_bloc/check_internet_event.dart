part of 'check_internet_bloc.dart';

@immutable
abstract class CheckInternetEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class InternetStatus extends CheckInternetEvent {
  final bool isOnline;
  InternetStatus(this.isOnline);

  @override
  List<Object?> get props => [isOnline];
}
