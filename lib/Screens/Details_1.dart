import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pets_1/Screens/Cart.dart';
import 'package:pets_1/Screens/wishlist.dart';
import '../Models/product_model.dart';

class ProductDetailsPage extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 300,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 15,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Text(
                widget.product.name,
                style: TextStyle(
                    color: Color(0xff739072),
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
              SizedBox(height: 10),
              Row(children: [
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4),
                  itemBuilder: (context, _) => Icon(Icons.star,
                      color: Color(
                        0xff739072,
                      )),
                  onRatingUpdate: (rating) {},
                  itemSize: 20,
                ),
                SizedBox(width: 5),
                Text(
                  widget.product.rating,
                  style: TextStyle(
                      color: Color(0xff739072),
                      fontSize: 13,
                      fontWeight: FontWeight.w800),
                ),
              ]),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Item Number: ',
                      style: TextStyle(
                          color: Color(0xff739072),
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                  Text(widget.product.Item_number,
                      style: TextStyle(
                          color: Color(0xff739072),
                          fontSize: 13,
                          fontWeight: FontWeight.w700)),
                  SizedBox(width: 40),
                  Text(widget.product.price,
                      style: TextStyle(
                          color: Color(0xff739072),
                          fontSize: 18,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              SizedBox(height: 10),
              Text(widget.product.description,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.w700)),
              SizedBox(height:20),
              Row(
                children: [
                  Text('Add to WishList ', style: TextStyle(
                      color: Color(0xff739072),
                      fontSize: 13,
                      fontWeight: FontWeight.w700)),
                  SizedBox(width:5),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                        Fav.addToFav(widget.product);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to WishList'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red[800] : Colors.grey,
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove,
                          color: Colors.black54,
                        )),
                    SizedBox(width: 5),
                    Text('0'),
                    SizedBox(width: 5),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add,
                          color: Colors.black54,
                        )),
                  ],
                )),
            SizedBox(width: 65),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff4F6F52),
                ),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Cart.addToCart(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added to Cart'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        icon: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.white,
                        )),
                    TextButton(
                        onPressed: () {
                          Cart.addToCart(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Added to Cart'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      width: 5,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
