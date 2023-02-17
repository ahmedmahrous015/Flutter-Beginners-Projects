part of 'resgister_cubit.dart';

@immutable
abstract class ResgisterState {}

class ResgisterInitial extends ResgisterState {}

class ResgisterLoading extends ResgisterState {}

class ResgisterSuccess extends ResgisterState {}

class Resgisterfailure extends ResgisterState {
  String errorMessage;
  Resgisterfailure({required this.errorMessage});
}
