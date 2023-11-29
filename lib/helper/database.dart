import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class coursesDataBase {
  List sections = [];
  List questions = [];

  // reference our box
  final _sectionsBox = Hive.box('sectionsBox');
  final _questionsBox = Hive.box('questionsBox');
  // run this method if this is the 1st time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Do Exercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update the database
  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}

// 
//
//              here the list need to fe filled
//
// 
Future<void> _fetchProducts() async {
  //String index = number.toString();
   String assetPath = 'lib/assets/JSON/security_questions.json';
   final String jsonString = await rootBundle.loadString(assetPath);
 try {
    String jsonString = await loadJsonAsset(assetPath);
    var data = json.decode(jsonString);
    print('Data: $data');
 } catch (e) {
    print('Error: $e');
 }

    List<Product> categoryProducts = [];
    for (var productData in data['products']) {
       List<String> productColors = [];
        for (var color in productData['colors']) {
          productColors.add(color);
        }

      Product product = Product(
        id: productData['id'],
        title: productData['title'],
        price: productData['price'],
        size: productData['size'],
        description: productData['description'],
        image: productData['image'],
        colors: productColors,
      );

      categoryProducts.add(product);
      print(product.colors);
    }

    final dataProvider = Provider.of<ProductsProvider>(context, listen: false);
    dataProvider.updateProducts(categoryProducts);

  }
  
  



									