import 'package:flutter/material.dart';

class ProductBox extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final double price;
  VoidCallback add;

  ProductBox(
    {
      super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.add,
    }
  );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/${image}',
            width: 200.0,
            height: 300.0
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              description,
              style: const TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 15.0,
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20.0
                      )
                    ),
                    Text(
                      '${price}VND',
                      style: const TextStyle(
                        fontSize: 15.0
                      )
                    )
                  ],
                ),
                ElevatedButton.icon
                (
                  onPressed: add, 
                  icon: const Icon(Icons.add),
                  label: const Text('Add your cart')
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
