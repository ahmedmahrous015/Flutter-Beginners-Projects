import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/widget/add_note_form.dart';

class AddNotesButtomSheet extends StatelessWidget {
  const AddNotesButtomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
            listener: (context, state) {
              if (state is AddNoteSuccess) {
                Navigator.pop(context);
              }
              if (state is AddNotefailure) {
                print('Feided ${state.errMessage}');
              }
            },
            builder: (context, state) {
              return  const SingleChildScrollView(
                child: AddNoteForm(),
              );
            },
          ),
        ),
      ],
    );
  }
}
