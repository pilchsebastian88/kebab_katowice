import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kebab_katowice/app/features/home/restaurants/cubit/restaurants_cubit.dart';

class RestaurantsPageContent extends StatelessWidget {
  const RestaurantsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (context) => RestaurantsCubit()..start(),
        child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return const Text('Wystąpił błąd');
            }
            if (state.isLoading) {
              return const CircularProgressIndicator();
            }
            final documents = state.documents;
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: ListView(
                children: [
                  for (final document in documents) ...[
                    Container(
                      color: const Color.fromARGB(255, 231, 167, 143),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(document['name']),
                              Text(document['kebab']),
                            ],
                          ),
                          Text(document['rating'].toString()),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
