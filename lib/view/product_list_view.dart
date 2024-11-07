// product_list.dart
import 'package:flutter/material.dart';
import 'package:della_collection/product/product.dart';

class ProductList extends ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  void loadProducts() {
    _products = [
      Product(
        id: '1',
        name: 'WS VARSHA OVERALL',
        description:
            'Varsha Overall hadir membawa gaya klasik tahun 90-an. Terinspirasi dari gaya vintage.',
        price: 469000.0,
        imageUrl: 'assets/images/baju/ws_varshall_overall.png',
      ),
      Product(
        id: '2',
        name: 'Gamis Polos',
        description:
            'BAJU GAMIS MAXXI DRES POLOSSAN ABAYA WANITA MUSLIMAH KEKINIAN.',
        price: 143000.0,
        imageUrl: 'assets/images/gamis/gamis_polos.png',
      ),
      Product(
        id: '3',
        name: 'Expand Depe Blouse',
        description:
            '- Knit top motif garis untuk gaya casual comfy- Warna beige- Kerah bulat- Unlined- Regular fit- Material Katun 40s tidak transparan, ringan, dan agak stretch',
        price: 345000.0,
        imageUrl: 'assets/images/baju/expand_depe_blouse.png',
      ),
      Product(
        id: '4',
        name: 'Arthesia Ghasan - Brown',
        description:
            '- Kemeja batik print lengan pendek dengan detail motif modern classic- Warna coklat- Detail kerah- Unlined- Regular fit-',
        price: 250000.0,
        imageUrl: 'assets/images/baju/arthesia_ghasan_brown.png',
      ),
    ];
    notifyListeners();
  }
}
