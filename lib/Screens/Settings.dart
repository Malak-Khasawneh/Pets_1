import 'package:flutter/material.dart';


class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon:Icon(Icons.arrow_back_ios), onPressed: (){
              Navigator.pop(context);
            },),
              title: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 26),),
          centerTitle: true ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),

                buildContainerWithItems([
                  {'title': 'Language', 'icon': Icons.language, 'color': Colors.black},
                  {'title': 'Reservations', 'icon': Icons.timer_sharp, 'color': Colors.black},
                  {'title': 'Terms of Use', 'icon': Icons.list_alt, 'color': Colors.black},
                  {'title': 'Privacy Policy', 'icon': Icons.privacy_tip_outlined, 'color': Colors.black},
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildContainerWithItems(List<Map<String, dynamic>> items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .asMap()
            .entries
            .map(
              (entry) => Column(
            children: [
              if (entry.key != 0) const Divider(height: 1, color: Colors.black12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: InkWell(
                  onTap: () {
                    // Add your logic for each button press here
                    switch (entry.value['title']) {
                      case 'Language':
                      // Handle Payment Method button press
                        break;

                      case 'Terms of Use':
                      // Handle Rate This App button press
                        break;
                      case 'Privacy Policy':
                      // Handle Log Out button press
                        break;
                    }
                  },
                  child: Row(
                    children: [
                      Icon(entry.value['icon'], color: Color(0xff3A4D39), size: 30),
                      SizedBox(width: 20),
                      Text(
                        entry.value['title'],
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        )
            .toList(),
      ),
    );
  }
}