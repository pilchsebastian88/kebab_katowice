part of 'restaurants_cubit.dart';

@immutable
class RestaurantsState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final String errorMessage;
  final bool isLoading;

  const RestaurantsState({
    required this.documents,
    required this.errorMessage,
    required this.isLoading,
  });
}
