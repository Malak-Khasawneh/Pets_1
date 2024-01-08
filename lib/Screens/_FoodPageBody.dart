import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pets_1/Models/Text.dart';
import 'package:pets_1/Models/product_model.dart';
import 'package:pets_1/Screens/Details_1.dart';
import 'package:pets_1/Screens/Products.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.88);
  //current page controller
  var _currentPageVal = 0.0;


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
          padding: const EdgeInsets.only(top:8,bottom: 3,left:8,right:8),
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
                      padding: const EdgeInsets.fromLTRB(10,1,10,1),
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
              SizedBox(height:3),
              Container(
                height: 650,
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
        image: 'assets/Images/SHIH TZU ADULT.webp',
        name: 'Royal Canin® Breed Health Nutrition® Shih Tzu Adult Dry Dog Food',
        price: '\$26.34 ',
        Item_number:'21001',
        rating: '4.0',
        reviews: '1234 reviews',
        description:'SHIH TZU ADULT helps reduce fecal smell and volume, and supports healthy digestion with highly digestible protein , a precise fiber content and high quality carbohydrate sources.',
      ),
      ProductModel(
        image:'assets/Images/Large Breed Adult.webp',
        name: 'Royal Canin Dog Food Large Breed Adult',
        price: '\$29.99 ',
        Item_number:'21002',
        rating: '5.0',
        reviews: '504 reviews',
        description:'ncorporating a combination of dry and wet food can benefit your dog. ',
      ),
      ProductModel(
        image: 'assets/Images/Labrador Retriever Puppy Dry Puppy Food.webp',
        name: 'Royal Canin® Breed Health Nutrition® Labrador Retriever Puppy Dry Food',
        price: '\$16.78 ',
        Item_number:'21013',
        rating: '5.0',
        reviews: '1032 reviews',
        description:'LABRADOR RETRIEVER PUPPY supports optimal development of the immune system, bones and joints, skin and coat, and gastrointestinal system.',
      ),
      ProductModel(
        image: 'assets/Images/Mini Puppy Dry Food.jpg',
        name: 'Royal Canin Canine Mini Puppy Dry Food',
        price: '\$31.20  ',
        Item_number:'22004',
        rating: '4.0',
        reviews: '980 reviews',
        description:'This premium puppy food is formulated with highly digestible proteins and fibres to support optimal digestive health and improve stool quality. ',
      ),


    ];

    return InkWell(
        onTap: () {
      // Navigate to the detailed information page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetailsPage(product: products[index]),
        ),
      );
    },
    child: Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 40),
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
            height: 120,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom:2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.white),
            child: Container(
              padding: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: Column(
                children: [
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
                        style: TextStyle(color: Colors.black54, fontSize: 10),
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
