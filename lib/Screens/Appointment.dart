import 'package:flutter/material.dart';
import 'package:pets_1/Screens/Home%20Page.dart';
import '../Models/Button.dart';
import 'package:pets_1/Models/Text.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  bool _isChecked = false;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = (await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ))!;
    if (picked != null && picked != selectedTime)
      setState(() {
        selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                   mainText(
                    'Reserve your Appointment'),
                  const SizedBox(height: 16.0),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller:TextEditingController(),
                        decoration: InputDecoration(labelText:'Pet Type',floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(),
                            hintText: 'e.g: Himalayan Cat',
                            suffixIcon: Icon(Icons.pets, color: Color(0xff739072),size: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)),
                            )
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller:TextEditingController(),
                        decoration: InputDecoration(labelText:'Pet Age',floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(),
                            hintText: 'e.g: 3 months',
                            suffixIcon: Icon(Icons.pets, color: Color(0xff739072),size: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)),
                            )
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller:TextEditingController(),
                        decoration: InputDecoration(labelText:'Pet Name',floatingLabelBehavior: FloatingLabelBehavior.always,
                            border: OutlineInputBorder(),
                            hintText: 'e.g: Consuella',
                            suffixIcon: Icon(Icons.pets, color: Color(0xff739072),size: 18,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(50)),
                            )
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      subText(
                        'Enter your Pets Gender',),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        checkColor: Color(0xff8F6FC2),
                      ),
                      const Text('Female', style: TextStyle(color: Color(0xff739072)), textAlign: TextAlign.left),
                      const SizedBox(width: 100.0),
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        checkColor: Color(0xff8F6FC2),
                      ),
                      const Text('Male', style: TextStyle(color:Color(0xff739072)), textAlign: TextAlign.right),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subText('Pick Date',),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.calendar_today),
                                onPressed: () => _selectDate(context),
                              ),
                              SizedBox(width: 10,),
                              Text('7/12/2023', style: TextStyle(color: Color(0xff739072)),)
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width:50),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          subText('Pick Time',),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.access_time),
                                onPressed: () => _selectTime(context),
                              ),
                              SizedBox(width: 10,),
                              Text('12:00 PM', style: TextStyle(color: Color(0xff739072)),)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                    SizedBox(height: 80),
                  ElevatedButton(
                    style: buttonPrimary,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()));
                    },
                    child: const Text('Confirm', style: TextStyle(color:Color(0xffF0ECE5), fontSize: 20)),
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
