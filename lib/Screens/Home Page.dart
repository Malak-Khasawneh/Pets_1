import 'package:flutter/material.dart';
import 'package:pets_1/Models/NavBar.dart';
import 'package:pets_1/Models/Text.dart';
import 'Doctors.dart';
import 'Settings.dart';

class Home extends StatelessWidget {
   Home({super.key});
  String name='Adam';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: secondaryBold('Hello, $name'),
        ),
        drawer: Setting(),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: TextEditingController(),
                        decoration: InputDecoration(
                          border:InputBorder.none,
                          labelText: 'Search Product',
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
              SizedBox(height: 20,),
              Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff4F6F52),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    top: 30,
                    child: Row(
                      children: [
                        beigeText('Discounts up to 20% \n On all products',25),
                        SizedBox(width:20),
                        Icon(Icons.celebration_outlined,size: 40,color: Color(0xffF0ECE5),)
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NavBarFood(),));
                    },
                    child: Container(
                      width: 99,
                      height: 99,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffECE3CE),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Image(
                              image: AssetImage('assets/Images/food.png'),
                            ),
                          ),
                          Text(
                            'Food',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NavBarOthers(),));
                    },
                    child: Container(
                      width: 99,
                      height: 99,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffECE3CE),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Image(
                              image: AssetImage('assets/Images/toys.png'),
                            ),
                          ),
                          Text(
                            'Toys',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  NavBarOthers()));
                    },
                    child: Container(
                      width: 99,
                      height: 99,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffECE3CE),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 14),
                            child: Image(
                              image: AssetImage('assets/Images/essentials.png'),
                            ),
                          ),
                          Text(
                            'Essentials',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
               Row(
                children: [
                  secondaryBold('Check out the latest'),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(height:120,width:double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(
                        height: 110,
                        child: TextButton(
                            onPressed: () {},
                            child:
                                Image(image: AssetImage('assets/Images/Ad5.webp'))),
                      ),
                      SizedBox(
                        height: 110,
                        child: TextButton(
                            onPressed: () {},
                            child:
                                Image(image: AssetImage('assets/Images/Ad3.jpg'))),
                      ),
                      SizedBox(
                        height: 110,
                        child: TextButton(
                            onPressed: () {},
                            child:
                            Image(image: AssetImage('assets/Images/hqdefault.jpg'))),
                      )
                    ],
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  secondaryBold('Choose your Vet',),
                  TextButton(
                    onPressed: () {},
                    child: secondaryText('see all',),
                  ),
                ],
              ),
              const SizedBox(height: 10),
          SizedBox(height:190,width:double.infinity,
            child: ListView(scrollDirection: Axis.horizontal,
                      children:[
                        DocWidget(
                        imageUrl: 'assets/Images/Dr.jpg',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DoctorProfile()));
                        },
                        name: 'Dr. Sarah Drue',
                        rate: 3.3,
                      ),
                    DocWidget(
                      imageUrl: 'assets/Images/Dr1.jpg',
                      onTap: () {},
                      name: 'Dr. Adam Link',
                      rate: 4.8,
                    ),
                    DocWidget(
                      imageUrl: 'assets/Images/dr3.jpg',
                      onTap: () {},
                      name: 'Dr. Mira Jack',
                      rate: 4.3,
                    ),
                  ],
                ),
          ),
            ]),
          ),
        ),
      ),
    );
  }
}

class DocWidget extends StatelessWidget {
  const DocWidget({
    super.key,
    required this.onTap,
    required this.imageUrl,
    required this.name,
    required this.rate,
  });

  final VoidCallback onTap;
  final String imageUrl;
  final String name;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        width: 130,
        height: 200,
        child: Column(
          children: [
            SizedBox(
              width: 130,
              height: 100,
              child: Image(
                image: AssetImage(imageUrl),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                secondaryText(name),
                Column(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amberAccent,
                    ),
                    Text(
                      '$rate',
                      style: TextStyle(fontSize: 10, color: Colors.amberAccent),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
