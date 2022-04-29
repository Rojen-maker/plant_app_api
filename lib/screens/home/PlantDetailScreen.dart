import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_app/globals/AppColors.dart';
import 'package:plant_app/screens/home/models/plant.dart';
import 'package:plant_app/screens/home/models/Plants.dart';

class PlantDetailScreen extends StatefulWidget {
  Plant plant;

  PlantDetailScreen({required this.plant});

  @override
  State<PlantDetailScreen> createState() => _PlantDetailScreenState();
}

class _PlantDetailScreenState extends State<PlantDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: Container(
                  color: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Living Room",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        widget.plant.name!,
                        style: Theme.of(context).textTheme.headline4?.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.white.withOpacity(0.2),
                          padding: EdgeInsets.all(10),
                          shape: StadiumBorder(),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Iconsax.gallery),
                              const Text(
                                "Add Photo",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 90,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white.withOpacity(0.1)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.6)),
                                  child: Icon(
                                    Icons.grass,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'Water',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'in 6 Days',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 90,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.white.withOpacity(0.1)),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.6)),
                                  child: const Icon(
                                    Icons.streetview,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'Fertilizing',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  'In 28 Days',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.55,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20.0))),
                child: Column(
                  children: [
                    Expanded(
                        child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.plant.category!,
                              style: TextStyle(
                                fontSize: 30,
                                color: AppColors.seventhColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              widget.plant.price!.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.seventhColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MaterialButton(
                        elevation: 0,
                        minWidth: double.infinity,
                        height: 60,
                        splashColor: Colors.green,
                        color: AppColors.sixthColor,
                        onPressed: () {},
                        child: const Text(
                          "Change Schedule",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              bottom: size.height * 0.47,
              left: 0,
              right: 0,
              child: Transform.translate(
                  offset: const Offset(130, 0),
                  child: Image.network(
                    'https://www.vmcdn.ca/f/files/glaciermedia/images/environment/castironplant.png',
                    fit: BoxFit.cover,
                  )))
        ],
      ),
    );
  }
}
