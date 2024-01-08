import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pets_1/Models/product_model.dart';
import 'package:pets_1/Screens/Details_1.dart';
import 'package:pets_1/Screens/wishlist.dart';

class Wet extends StatefulWidget {
  const Wet({Key? key}) : super(key: key);

  @override
  State<Wet> createState() => _WetState();
}

class _WetState extends State<Wet> {
  PageController pageController = PageController(viewportFraction: 0.88);
  //current page controller
  var _currentPageVal = 0.0;
  List<ProductModel> WishList = [];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageVal = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 3, left: 8, right: 8),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      padding: const EdgeInsets.fromLTRB(10, 1, 10, 1),
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Product',
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 3),
              Container(
                height: 680,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  controller: pageController,
                  itemCount: 4,
                  itemBuilder: (context, position) {
                    return _buildPageItem(position);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    List<ProductModel> products = [
      ProductModel(
        image: 'assets/Images/wet_1.webp',
        name: 'Red dragon dog wet food in chicken flavor',
        price: '\$6.34 ',
        Item_number: '23001',
        rating: '4.0',
        reviews: '1234 reviews',
        description:
            'It\'s ideal for dogs who love wet food and prefer beef as the main ingredient.',
      ),
      ProductModel(
        image: 'assets/Images/wet_2.jpg',
        name: 'Royal Canin Sterilised Wet food',
        price: '\$7.99 ',
        Item_number: '23002',
        rating: '5.0',
        reviews: '504 reviews',
        description:
            'Helps maintain ideal weight of sterilised cats. \nHelps support a healthy urinary system.\nFormulated to match the optimal Macro Nutritional Profile instinctively preferred by adult cats.',
      ),
      ProductModel(
        image: 'assets/Images/wet_3.png',
        name: 'Tenders in Sauce With Real Salmon & Crab',
        price: '\$6.78 ',
        Item_number: '23013',
        rating: '5.0',
        reviews: '1032 reviews',
        description:
            'Complete feed for dogs - Specially for adult and mature Poodles - Over 10 months old (loaf)',
      ),
      ProductModel(
        image: 'assets/Images/wet_4.png',
        name:
            'Pedigree Wet Dog Food - Chicken Grilled Liver in Loaf with Vegetables',
        price: '\$15.20  ',
        Item_number: '23004',
        rating: '4.0',
        reviews: '980 reviews',
        description:
            'Soft & shiny skin and coat, Strong muscles. \nGood digestive health, Healthy bones & teeth , and Better immunity.',
      ),
    ];
    return InkWell(
        onTap: () {
          // Navigate to the detailed information page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductDetailsPage(product: products[index]),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              height: 220,
              margin:
                  const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: AssetImage(products[index].image),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 30,
              right: 30,
              child: Container(
                height: 130,
                margin: const EdgeInsets.only(left: 30, right: 30, bottom: 2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                child: Container(
                  padding: EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Column(
                    children: [
                      //TextButton(onPressed: (){},child:
                      Text(
                        products[index].name,
                        style: TextStyle(
                            color: Color(0xff739072),
                            fontSize: 13,
                            fontWeight: FontWeight.w800),
                      ),

                      SizedBox(height: 10),
                      Row(
                        children: [
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
                            products[index].rating,
                            style: TextStyle(
                                color: Color(0xff739072),
                                fontSize: 13,
                                fontWeight: FontWeight.w800),
                          ),
                          SizedBox(width: 10),
                          Text(
                            products[index].reviews,
                            style:
                                TextStyle(color: Colors.black54, fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            products[index].price,
                            style: TextStyle(
                                color: Color(0xff739072),
                                fontSize: 13,
                                fontWeight: FontWeight.w800),
                          ),
                          // IconButton(
                          //     onPressed: () {
                          //
                          //       if (!WishList.contains(products[index])) {
                          //         // Add the product to the wishlist
                          //         setState(() {
                          //           WishList.add(products[index]);
                          //         });
                          //
                          //         ScaffoldMessenger.of(context).showSnackBar(
                          //           SnackBar(
                          //             content: Text('Added to Wishlist'),
                          //             duration: Duration(seconds: 2),
                          //           ),
                          //         );
                          //       } else {
                          //
                          //         ScaffoldMessenger.of(context).showSnackBar(
                          //           SnackBar(
                          //             content: Text('Already in Wishlist'),
                          //             duration: Duration(seconds: 2),
                          //           ),
                          //         );
                          //       }
                          //       ;
                          //     },
                          //     icon: Icon(WishList.contains(products[index])
                          //         ? Icons.favorite
                          //         : Icons.favorite_border,
                          //       color: WishList.contains(products[index])
                          //           ? Colors.red
                          //           : null,
                          //     size: 20,),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
