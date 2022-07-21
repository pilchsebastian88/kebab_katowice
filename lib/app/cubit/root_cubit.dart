import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(const RootState(
          user: null,
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }

  Future<void> start() async {
    emit(
      const RootState(
        user: null,
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        emit(
          RootState(
            user: user,
            errorMessage: '',
            isLoading: false,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            RootState(
              user: null,
              errorMessage: error.toString(),
              isLoading: false,
            ),
          );
        },
      );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
