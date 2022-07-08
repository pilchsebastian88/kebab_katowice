import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'restaurants_state.dart';

class RestaurantsCubit extends Cubit<RestaurantsState> {
  RestaurantsCubit()
      : super(const RestaurantsState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(const RestaurantsState(
      documents: [],
      errorMessage: '',
      isLoading: true,
    ));

    await Future.delayed(const Duration(seconds: 2));

    _streamSubscription = FirebaseFirestore.instance
        .collection('restaurants')
        .orderBy('rating', descending: true)
        .snapshots()
        .listen((data) {
      emit(
        RestaurantsState(
          documents: data.docs,
          errorMessage: '',
          isLoading: false,
        ),
      );
    })
      ..onError((error) {
        emit(
          RestaurantsState(
            documents: const [],
            errorMessage: error.toString(),
            isLoading: false,
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
