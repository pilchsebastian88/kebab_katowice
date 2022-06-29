import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var kebabName = '';
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: const InputDecoration(
                hintText: 'podaj nazwę restauracji',
              ),
              onChanged: (newValue) {
                setState(() {
                  restaurantName = newValue;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'podaj nazwę kebaba',
              ),
              onChanged: (newValue) {
                setState(() {
                  kebabName = newValue;
                });
              },
            ),
            const SizedBox(height: 20),
            Slider(
                min: 1.0,
                max: 6.0,
                divisions: 10,
                value: rating,
                label: rating.toString(),
                onChanged: (newValue) {
                  setState(() {
                    rating = newValue;
                  });
                }),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: restaurantName.isEmpty || kebabName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('restaurants').add({
                        'name': restaurantName,
                        'kebab': kebabName,
                        'rating': rating,
                      });
                    },
              child: const Text('Dodaj'),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
