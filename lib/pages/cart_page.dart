import 'package:addidas_shop/data/cart_database.dart';
import 'package:addidas_shop/widgets/cart_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  final _myBox = Hive.box('mybox');
  CartDatabase db = CartDatabase();

  // List carts = [
  //   ['lg1.png', 'Clothes', 20000.0],
  //   ['lg1.png', 'Clothes', 20000.0],
  //   ['lg1.png', 'Clothes', 20000.0],
  // ];

  @override
  void initState() {
    if (_myBox.get("LISTCART") == null) {
      db.initDB();
    } else {
      db.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 224, 224),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'My Cart',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20.0
            )
          ),
         Expanded(
           child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: db.listCart.length,
              itemBuilder: (context, index) {
                return CartBox(
                  image: db.listCart[index][0], 
                  title: db.listCart[index][1], 
                  price: db.listCart[index][2], 
                  checked: db.listCart[index][3],
                  onDeleted: (f0) {},
                  // onChecked: () {},
                );
              },
            ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(25.0),
           child: GestureDetector(
            onTap: () {}, 
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 80.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Colors.black
              ),
              child: const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.monetization_on,
                    // color: Colors.white),
                    Text(
                      'PAY',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0
                      )
                    ),
                  ],
                ),
              ),
            )
           ),
         )
        ],
      )
    );
  }
}