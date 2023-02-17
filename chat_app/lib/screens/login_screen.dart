import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:scholar_chat/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholar_chat/cubits/login_cubit/login_cubit.dart';
import 'package:scholar_chat/helper/show_snack_bar.dart';
import 'package:scholar_chat/screens/chat_screen.dart';
import 'package:scholar_chat/screens/resgister_screen.dart';
import 'package:scholar_chat/widgets/constants.dart';
import 'package:scholar_chat/widgets/custom_botton.dart';
import 'package:scholar_chat/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  String? email, password;

  bool isLoading = false;

  GlobalKey<FormState> fromkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatScreen.id, arguments: email);
          isLoading = false;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.errorMessage);
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
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
                        'LOGIN',
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
                    obscureText: true,
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
                        BlocProvider.of<LoginCubit>(context)
                            .loginUser(email: email!, password: password!);
                      }
                    },
                    text: 'LOGIN',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dont\'t have an account',
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, ResgisterScreen.id);
                        },
                        child: Text(
                          '  Register',
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
      ),
    );
  }

  Future<void> loginUser() async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
