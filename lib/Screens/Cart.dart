import 'package:flutter/material.dart';
import 'package:pets_1/Models/Button.dart';
import 'package:pets_1/Models/product_model.dart';
import 'package:pets_1/Screens/End.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Retrieve the cart items
    List<ProductModel> cartItems = Cart.getCartItems();
    double totalPrice = Cart.calculateTotalPrice();
    double Delivery = Cart.calculateDeliveryPrice(0.75);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(50),
          child: Container(
              child: Text(
            'Shopping Cart',
            style: TextStyle(
                color: Color(0xff739072), fontWeight: FontWeight.bold),
          )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            SizedBox(
              height: 370,
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(cartItems[index].name,
                        style: TextStyle(
                            color: Color(0xff739072),
                            fontSize: 14,
                            fontWeight: FontWeight.w700)),
                    subtitle: Row(
                      children: [
                        Text(cartItems[index].price,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700)),
                        SizedBox(width: 60),
                        IconButton(
                            onPressed: () {
                              Cart.deleteFromCart(cartItems[index]);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Removed from Cart'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: Icon(Icons.delete))
                      ],
                    ),
                    leading: Image.asset(cartItems[index].image),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Payment Summary',
                        style: TextStyle(
                            color: Color(0xff739072),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Basket Total',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 247),
                          Text(
                            '\$ $totalPrice',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Delivery fee',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 250),
                          Text(
                            '\$ 0.75',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Text(
                            'Total amount',
                            style: TextStyle(
                                color: Color(0xff739072),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 240),
                          Text(
                            '\$ $Delivery',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height:30),
                      Row(
                        children: [
                          SizedBox(width:250),
                          Text(
                            'Continue',
                            style: TextStyle(
                                color: Color(0xff739072),
                                fontWeight: FontWeight.bold,
                            fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => End()),
                              );
                            },
                            icon: Icon(Icons.navigate_next,
                                color: Color(0xff739072)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Cart {
  static List<ProductModel> cartItems = [];

  static void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  static void deleteFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  static double calculateTotalPrice() {
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += double.parse(
          item.price.substring(1)); // Assuming price is in format '$XX.XX'
    }
    return double.parse(totalPrice.toStringAsFixed(3));
  }

  static double calculateDeliveryPrice(double Delivery) {
    double totalPrice = calculateTotalPrice();

    return double.parse((totalPrice + Delivery).toStringAsFixed(3));
  }

  static List<ProductModel> getCartItems() {
    return cartItems;
  }
}
