import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widget/constants.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async{
    emit(AddNoteLoading());
    try {
      
      var noteModle = Hive.box<NoteModel>(kNotesBox);
    await  noteModle.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNotefailure(e.toString()));
    }
  }
}
