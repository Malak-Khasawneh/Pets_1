import 'package:flutter/material.dart';
import 'package:pets_1/Models/Text.dart';
import 'package:pets_1/Screens/Rate.dart';
import 'package:pets_1/Screens/authentication.dart';
import 'package:pets_1/Screens/wishlist.dart';
import '../Models/Button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage(
                          'assets/Images/profile pic.png'),
                    ),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Adam Sam',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Adam.S@gmail.com',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 30.0),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditProfilePage()),
                        );
                      },
                      child: Icon(
                        Icons.edit,
                        size: 30,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),


                SizedBox(height: 50.0,),
                Container( width: 350.0,height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xffF8F6FC),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Expanded(child: secondaryBold('Wishlist')),
                        IconButton(onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) =>  WishList()),);
                        }, icon:Icon(Icons.favorite),color: Color(0xff3A4D39)), ],)
                ),
                SizedBox(height: 20.0,),
                Container( width: 350.0,height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xffF8F6FC),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Expanded(child: secondaryBold('Rate this app')),
                        IconButton(onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Rate()),);
                        }, icon:Icon(Icons.star_rate),color: Color(0xff3A4D39)), ],)
                ),
                SizedBox(height: 20.0,),
                Container( width: 350.0,height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xffF8F6FC),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Expanded(child: secondaryBold('Your Reservations')),
                        IconButton(onPressed: (){},
                            icon:Icon(Icons.schedule),color: Color(0xff3A4D39)), ],)
                ),
                SizedBox(height: 20.0,),
                Container( width: 350.0,height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xffF8F6FC),
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 10.0,),
                        Expanded(child: secondaryBold('Log out')),
                        IconButton(onPressed: () async {
                          await AuthService().signOutUser();
                        },
                            icon:Icon(Icons.logout),color: Color(0xff3A4D39)), ],)
                ),
],
      ),
    ))));
  }
}

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 8),
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
               mainText('Profile Settings'),
              const SizedBox(height: 16.0),
              const CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage(
                    'assets/Images/profile pic.png'),
              ),
              const SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'First Name'),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Last Name'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Gender'),
                    ),
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'Phone Number'),
                      obscureText: true,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),
              ElevatedButton(
                style: buttonPrimary,
                onPressed: () {
                  // Implement logic to save edited profile
                  Navigator.pop(context); // Navigate back to the profile page
                },
                child: const Text('Save Changes',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
