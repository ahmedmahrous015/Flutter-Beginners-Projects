import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/cubits/resgister_cubit/resgister_cubit.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/widgets/constants.dart';
import 'package:scholar_chat/widgets/custom_botton.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class ResgisterScreen extends StatelessWidget {
  static String id = 'ResgisterScreen';

  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> fromkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResgisterCubit, ResgisterState>(
      listener: (context, state) {
       if (state is ResgisterLoading) {
          isLoading = true;
        } else if (state is ResgisterSuccess) {
          isLoading = false;
          Navigator.pushNamed(context, ChatScreen.id,arguments: email);
        } else if (state is Resgisterfailure) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: false,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Form(
                key: fromkey,
                child: Column(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Image.asset(kLogo),
                    const Text(
                      'Chat App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        const Text(
                          'RESGISTER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Pasword',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      onTap: () async {
                        if (fromkey.currentState!.validate()) {
                          BlocProvider.of<ResgisterCubit>(context)
                              .registerUser(email: email!, password: password!);
                        }
                      },
                      text: 'RESGISTER',
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'already have an account?',
                          style: TextStyle(color: Colors.white),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '  Login',
                            style: TextStyle(color: Color(0xffC7EDE6)),
                          ),
                        ),
                      ],
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> registerUser() async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
