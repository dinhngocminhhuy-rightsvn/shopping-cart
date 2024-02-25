import 'package:addidas_shop/data/cart_database.dart';
import 'package:addidas_shop/widgets/product_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:hive/hive.dart';

class ShopPage extends StatefulWidget {

  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

   // reference the hive box
  final _myBox = Hive.box('mybox');
  CartDatabase db = CartDatabase();

  List products = [
    ['lg1.png', 'Addidas', 'This is a very convenient clothes. This product is excluded from all promotional discounts and offers.', 30000.0],
    ['lg1.png', 'GoGo', 'This is a very convenient clothes. This product is excluded from all promotional discounts and offers.', 30000.0],
    ['lg1.png', 'Addidas Pro', 'This is a very convenient clothes. This product is excluded from all promotional discounts and offers.', 50000.0],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 224, 224),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: 'Search',
                contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(25.7),
                  ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0),
            child: Center(
              child: Text(
                'everyone flies.. some fly longer than others',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 15.0
                )
              )
            ),
          ),
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Hot Picks',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 25.0,
                          )
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.favorite, color: Colors.red),
                        )
                      ]
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: ElevatedButton(
                        onPressed: () {}, 
                        child: const Text('See all')),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FlutterCarousel(
                  options: CarouselOptions(
                    height: 500.0, 
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(
                      currentIndicatorColor: Colors.lightBlue,
                    ),
                  ),
                    items: products.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            // child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                            child: ProductBox(
                              image: i[0], 
                              title: i[1], 
                              description: i[2], 
                              price: i[3], 
                              add: (){
                                setState(() {
                                  db.listCart.add(
                                    [i[0],i[1],i[3],false]
                                  );
                                  print(db.listCart.length);
                                  db.updateDatabase();
                                });
                              }
                            )
                          );
                        },
                      );
                    }
                  ).toList(),
                )
              )
            ],
          )
        ],
      )
    );
  }
}