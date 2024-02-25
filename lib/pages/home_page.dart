import 'package:addidas_shop/pages/cart_page.dart';
import 'package:addidas_shop/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List _screenPages = const [
    ShopPage(),
    CartPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 225, 224, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 225, 224, 224),
        leading: Builder(
            builder: (BuildContext context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.menu)
          )
        ),
      ),
      body: _screenPages[_currentIndex],
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://ca.slack-edge.com/T02DUT0MB-U0491EDDT2T-97aae12b2223-512'),
                ),
                accountEmail: Text(
                    'mhuy13660@gmail.com', 
                    style: TextStyle(color: Colors.black)
                ),
                accountName: Text(
                  'Huy minh',
                  style: TextStyle(fontSize: 24.0, color: Colors.black),
                ),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 225, 224, 224),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.house),
                title: const Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: AutofillHints.creditCardName,
                    
                  ),
                ),
                onTap: () {
                   Navigator.pushNamed(context, '/homepage');
                },
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontFamily: AutofillHints.creditCardName,
                    
                  ),
                ),
                onTap: () {
                   Navigator.pushNamed(context, '/cartpage');
                },
              ),
            ],
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => {
          setState(() => _currentIndex = index)
        },
        backgroundColor: const Color.fromARGB(255, 225, 224, 224),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Shop'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'My cart'
          ),
        ]
      ),
    );
  }
}
