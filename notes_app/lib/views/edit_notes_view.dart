import 'package:flutter/material.dart';
import 'package:notes_app/widget/custom_app_bar.dart';
import 'package:notes_app/widget/custom_text_field.dart';

class EidtNotesVeiw extends StatelessWidget {
  const EidtNotesVeiw({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: const [
            SizedBox(
              height: 50,
            ),
            CustomAppBar(
              text: 'Edit Notes',
              icon: Icons.check,
            ),
            SizedBox(
              height: 50,
            ),
            CustomTextField(
              hint: 'Title',
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: 'Content',
              maxlines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
