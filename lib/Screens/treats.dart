import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pets_1/Models/product_model.dart';
import 'package:pets_1/Screens/Details_1.dart';


class TreatBody extends StatefulWidget {
  const TreatBody({Key? key}) : super(key: key);

  @override
  State<TreatBody> createState() => _TreatsState();
}

class _TreatsState extends State<TreatBody> {
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
        image: 'assets/Images/treat_1.png',
        name: 'Ziwi Good Dog Rewards Air-Dried Beef Dog Treats',
        price: '\$12.30 ',
        Item_number:'22001',
        rating: '4.0',
        reviews: '1234 reviews',
        description:'Contain 96% premium New Zealand beef meat, including tripe, and green mussels.',
      ),
      ProductModel(
        image:'assets/Images/treat_2.png',
        name: 'Stella & Chewy’s Freeze-Dried Raw Carnivore Crunch Dog Treats',
        price: '\$9.99 ',
        Item_number:'22002',
        rating: '5.0',
        reviews: '504 reviews',
        description:'98% beef, nutrient-rich organs & bone. \nPerfect for training and treating',
      ),
      ProductModel(
        image: 'assets/Images/catTreat_3.jpg',
        name: 'Irresistibles® Soft Cat Treats With White Chicken Meat',
        price: '\$16.78 ',
        Item_number:'22013',
        rating: '5.0',
        reviews: '1032 reviews',
        description:'Made With Real Meat and No Artificial Flavors',
      ),
      ProductModel(
        image: 'assets/Images/treat_4.png',
        name: 'Best Bully Sticks 6-Inch Bully Sticks',
        price: '\$30.00  ',
        Item_number:'22006',
        rating: '4.0',
        reviews: '980 reviews',
        description:'Perfect for smaller breeds of dogs. \nThey are made from free-range Brazilian cattle and are a great choice for an all-natural dog chew.',
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
    child:Stack(
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
