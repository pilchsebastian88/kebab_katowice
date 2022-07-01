import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantsPageContent extends StatelessWidget {
  const RestaurantsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('restaurants')
            .orderBy('rating', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Wystąpił błąd');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('Trwa ładowanie danych');
          }
          final documents = snapshot.data!.docs;
          return Padding(
            padding: const EdgeInsets.all(6.0),
            child: ListView(
              children: [
                for (final document in documents) ...[
                  Container(
                    color: Color.fromARGB(255, 231, 167, 143),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
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
    );
  }
}
