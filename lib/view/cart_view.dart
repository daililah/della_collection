import 'package:della_collection/view/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:della_collection/product/product.dart';
import 'package:intl/intl.dart'; // Import the intl package

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItems = [
      {'productId': '1', 'quantity': 1},
    ];

    final productList = Provider.of<ProductList>(context);
    final totalPrice = cartItems.fold<double>(
      0,
      (sum, item) {
        final product = productList.products.firstWhere(
          (p) => p.id == item['productId'],
          orElse: () => Product(
            id: '',
            name: 'Unknown',
            description: '',
            price: 0.0,
            imageUrl: '',
          ),
        );
        return sum + (product.price * (item['quantity'] as int? ?? 1));
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang Saya'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          final product = productList.products.firstWhere(
            (p) => p.id == cartItem['productId'],
            orElse: () => Product(
              id: '',
              name: 'Unknown',
              description: '',
              price: 0.0,
              imageUrl: '',
            ),
          );

          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.asset(product.imageUrl),
              title: Text(product.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      formatRupiah(product.price)), // Use formatRupiah function
                  Text('Quantity: ${cartItem['quantity']}'),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total: ${formatRupiah(totalPrice)}', // Use formatRupiah function
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to format price in rupiah
  String formatRupiah(double price) {
    final formatter = NumberFormat.currency(
        locale: 'id', symbol: 'Rp '); // Set locale and symbol
    return formatter.format(price);
  }
}
