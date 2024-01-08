import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({super.key});

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  // List of items for suggestions
  final List<String> items = [
    'Dry Food',
    'Wet Food',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SearchAnchor(
                  builder: (BuildContext context, SearchController controller) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      onTap: () {
                        controller.openView();
                      },
                      onChanged: (_) {
                        controller.openView();
                      },
                    );
                  },
                  suggestionsBuilder:
                      (BuildContext context, SearchController controller) {
                    return List<ListTile>.generate(items.length, (int index) {
                      final String item = items[index];
                      return ListTile(
                        title: Text(
                          item,
                          style: TextStyle(color: Color(0xff8F6FC2)),
                        ),
                        onTap: () {
                          setState(() {
                            controller.closeView(item);
                          });
                        },
                      );
                    });
                  },
                ),
                SizedBox(height:20),


                            SizedBox(
                                  height: 710,
                                  width: 500,
                                  child:  GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 30,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(images[index],width: 190,height: 120,),
                        Text(names[index]),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(price[index],style: TextStyle(color: Color(0xff8F6FC2)),),
                            Icon(Icons.add_circle_outline_outlined,size: 20,color:Color(0xff8F6FC2) ),
                          ],
                        ),


                      ],
                    );
                  })
                            ),
              ],

            ),
          ),
        ),
      ),
    );
  }
  List<String> names=[
    'Pedigree -for dogs','OZZO -for dogs','Pedigree -for dogs','OZZO -for dogs','Pedigree -for dogs','OZZO -for dogs'
  ];
  List<String> price=[
    '\$9.99','\$17.99','\$9.99','\$17.99','\$9.99','\$17.99',
  ];
  List<String> images=[
    'assets/Images/images (1).jpg','assets/Images/img1.jpg', 'assets/Images/images (1).jpg','assets/Images/img1.jpg', 'assets/Images/images (1).jpg','assets/Images/img1.jpg',
  ];
}
