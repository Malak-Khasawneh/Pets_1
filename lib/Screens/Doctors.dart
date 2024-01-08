import 'package:flutter/material.dart';
import 'Appointment.dart';
import '../Models/Button.dart';
import '../Models/Text.dart';


class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/Images/Dr.jpg'),
                  SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mainText('Dr. Sarah Drue'),
                      IconButton(onPressed: (){}, icon: Icon(Icons.star), color: Colors.amber,)
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      secondaryText('Amman, Abdoun'),
                      secondaryText('+962-7987 56 435'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Center(
                      child: secondaryText('Sarah@vet.com'),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('5 years experience ~ Worked in LA for 3 years\n diploma in veterinary medicine from UK.\n If you want your pet to be smothered with love\n and joy you found the right place!',style: TextStyle(fontSize: 15,color: Colors.black),),
                    ],
                  ),
                  SizedBox(height: 100),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Appointment()));
                    },
                    child: const Text('Make Reservation', style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                 ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

