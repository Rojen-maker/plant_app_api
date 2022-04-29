import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_app/screens/home/PlantDetailScreen.dart';
import 'package:plant_app/screens/home/HomeScreen.dart';

import '../globals/AppColors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

 List<Widget> tabs = [
   HomeScreen(),
   HomeScreen(),

 ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Center(
            child: Text("Plant App", style: TextStyle(color: Colors.black)),
          ),
          leading: const Icon(Icons.add_a_photo, color: Colors.black),
          bottom:  TabBar(
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.secondaryColor),
              tabs: const [
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("My Garden"),
                  ),
                ),
                Tab(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Snap History"),
                  ),
                ),
              ]),
        ),

        bottomNavigationBar: BottomNavigationBar(
          selectedIconTheme: IconThemeData(color: Colors.green, size: 10),
          selectedItemColor: Colors.white,
          backgroundColor: AppColors.secondaryColor,
          type: BottomNavigationBarType.fixed,
          items:[
            BottomNavigationBarItem(
                icon: Icon(Iconsax.home), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Iconsax.mobile_programming5), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.people), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: ''),
          ],
        ),
        body: TabBarView(children: tabs)
      ),
    );
  }
}
