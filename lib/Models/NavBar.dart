import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pets_1/Screens/DryFood.dart';
import 'package:pets_1/Screens/essentials.dart';
import 'package:pets_1/Screens/meds.dart';
import 'package:pets_1/Screens/toys.dart';
import 'package:pets_1/Screens/treats.dart';
import 'package:pets_1/Screens/wetFood.dart';
import '../Screens/Cart.dart';
import '../Screens/Home Page.dart';
import '../Screens/Profile.dart';


class NavBar extends StatelessWidget {
  const NavBar({super.key, Key? k});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(

      bottomNavigationBar:
      Obx(
            () => BottomNavigationBar(type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Color(0xff3A4D39),

          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) =>
          controller.selectedIndex.value = index,

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.category_outlined), label: ''),

          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [ Home(),  CartPage(),  const Profile(), NavBarFood()];

}

class NavBarFood extends StatelessWidget {
  const NavBarFood({super.key, Key? k});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController_());
    return Scaffold(

      bottomNavigationBar:
      Obx(
            () => BottomNavigationBar(type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Color(0xff739072),
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) =>
          controller.selectedIndex.value = index,

          items:  [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(icon: Image.asset(height: 30,'assets/Icons/food.png'), label: ''),
            BottomNavigationBarItem(icon: Image.asset(height: 30,'assets/Icons/cat-food.png'), label: ''),
            BottomNavigationBarItem(icon: Image.asset(height: 30,'assets/Icons/dog-treat.png'), label: ''),

          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController_ extends GetxController {
  final Rx<int> selectedIndex = 1.obs;
  final screens = [ NavBar(), FoodPageBody(),  Wet(), TreatBody(),  ];

}


class NavBarOthers extends StatelessWidget {
  const NavBarOthers({super.key, Key? k});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController_1());
    return Scaffold(

      bottomNavigationBar:
      Obx(
            () => BottomNavigationBar(type: BottomNavigationBarType.fixed,
          unselectedItemColor: Colors.black,
          selectedItemColor: Color(0xff739072),
          elevation: 0,
          currentIndex: controller.selectedIndex.value,
          onTap: (index) =>
          controller.selectedIndex.value = index,

          items:  [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
            BottomNavigationBarItem(icon: Image.asset(height: 25,'assets/Icons/toys.png'), label: ''),
            BottomNavigationBarItem(icon: Image.asset(height: 30,'assets/Icons/pet.png'), label: ''),
            BottomNavigationBarItem(icon: Image.asset(height: 25,'assets/Icons/veterinary.png'), label: ''),

          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController_1 extends GetxController {
  final Rx<int> selectedIndex = 1.obs;
  final screens = [ NavBar(),Toys(), Essentials(), Medicine() ];

}