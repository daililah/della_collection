import 'package:della_collection/view/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:della_collection/product/product.dart';
import 'package:provider/provider.dart';

class ProductViewModel extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void loadProducts(BuildContext context) {
    _products = Provider.of<ProductList>(context, listen: false).products;
    notifyListeners();
  }
}
