import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartBox extends StatelessWidget {
  final String image;
  final String title;
  final double price;
  final bool checked;
  Function(bool?) ? onChecked;
  Function(BuildContext) ? onDeleted;

  CartBox({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.checked,
    this.onChecked,
    this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: onDeleted,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(20.0),
            )
          ]
        ),
        child: Container(
        padding: const EdgeInsets.all(15.0),
        // color: Colors.white,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        height: 100.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/${image}',
                  width: 80.0,
                  height: 60.0
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 17.0
                        )
                      ),
                      Text(
                        price.toString(),
                        style: const TextStyle(
                          fontSize: 15.0
                        ),
                      )
                    ]
                  ),
                ),
              ],
            ),
            // IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
            Checkbox(value: checked, onChanged: onChecked)
          ],
        ),
      ),
      )
      
    );
  }
}