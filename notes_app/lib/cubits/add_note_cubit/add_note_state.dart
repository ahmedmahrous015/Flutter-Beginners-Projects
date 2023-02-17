part of 'add_note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNoteSuccess extends AddNoteState {}

class AddNotefailure extends AddNoteState {
  final  String errMessage;

  AddNotefailure(this.errMessage);
  
}
