

import 'package:hive/hive.dart';

class CartDatabase {
  List listCart = [];

  // reference out box
  final _myBox = Hive.box('mybox');

  void initDB() {
    listCart = [
       ['lg1.png', 'Clothes', 20000.0, false],
       ['lg1.png', 'Shoes', 10000.0, false],
       ['lg1.png', 'Tshirts', 50000.0, false],
    ];
  }

  // load the data from db
  void loadData() {
    listCart = _myBox.get("LISTCART");
  }

  // update the db
  void updateDatabase() {
    _myBox.put("LISTCART",listCart);
  }

}