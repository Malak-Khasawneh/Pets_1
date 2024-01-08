import 'package:flutter/material.dart';
import 'package:pets_1/Models/Text.dart';

import '../Models/product_model.dart';

class WishList extends StatelessWidget {
   WishList({super.key});
   List<ProductModel> favItems = Fav.getFavItems();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Container( width: 350.0,height: 70,
            decoration: BoxDecoration(
              color: Color(0xffF8F6FC),
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                mainText('My Wishlist'),
                SizedBox(width: 20,),
                Icon(Icons.favorite,color: Color(0xff3A4D39),),
              ],),
              ),
              ),
              SizedBox(height: 20,),
              SizedBox(height:590,
                child: ListView.builder(
                  itemCount: favItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(favItems[index].name,
                          style: TextStyle(
                              color: Color(0xff739072),
                              fontSize: 14,
                              fontWeight: FontWeight.w700)),
                      subtitle: Row(
                        children: [
                          Text(favItems[index].price,
                              style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                          IconButton(
                            onPressed: () {
                              Fav.deleteFromFav(favItems[index]); // Use correct parameter
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Removed from WhishList'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            icon: Icon(Icons.favorite,color: Colors.red[800],),
                          )
                        ],
                      ),
                      leading: Image.asset(favItems[index].image),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Fav {
  static List<ProductModel> cartItems = [];

  static void addToFav(ProductModel product) {
    cartItems.add(product);
  }

  static void deleteFromFav(ProductModel product) {
    cartItems.remove(product);
  }

  static List<ProductModel> getFavItems() {
    return cartItems;
  }
}