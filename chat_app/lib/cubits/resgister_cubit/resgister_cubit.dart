import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'resgister_state.dart';

class ResgisterCubit extends Cubit<ResgisterState> {
  ResgisterCubit() : super(ResgisterInitial());
  Future<void> registerUser(
      {required String email, required String password}) async {
    emit(ResgisterLoading());
    try {
      UserCredential User =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(ResgisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(Resgisterfailure(errorMessage: 'weak-password'));
        
      } else if (e.code == 'email-already-in-use') {
         emit(Resgisterfailure(errorMessage: 'email-already-in-use'));
      }
    } catch (e) {
      emit(Resgisterfailure(errorMessage: 'there was an error'));
    }
  }
}
