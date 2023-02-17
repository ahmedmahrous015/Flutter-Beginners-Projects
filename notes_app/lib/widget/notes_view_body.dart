import 'package:flutter/material.dart';
import 'package:notes_app/widget/custom_app_bar.dart';
import 'package:notes_app/widget/notes_list_view.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(text: 'Notes', icon: Icons.search_sharp,),
          Expanded(child: NoteListView()),
        ],
      ),
    );
  }
}

