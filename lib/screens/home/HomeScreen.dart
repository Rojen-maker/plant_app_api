import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:plant_app/globals/AppColors.dart';
import 'package:plant_app/network/api_service.dart';
import 'package:plant_app/network/api_url.dart';
import 'package:plant_app/screens/home/models/plant.dart';
import 'package:plant_app/screens/home/PlantDetailScreen.dart';
import 'package:plant_app/screens/home/models/Plants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
bool isLoading = true;
/*  List<Plants> plantsList = [
    Plants(
        name: 'Rose',
        description:
            'A rose is a woody perennial flowering plant of the genus Rosa, in the family Rosaceae, or the flower it bears. Roses are erect, climbing, or trailing shrubs, the stems of which are usually copiously armed with prickles of various shapes and sizes, commonly called thorns. The leaves are alternate and pinnately compound (i.e., feather-formed), usually with oval leaflets that are sharply toothed. The flowers of wild roses usually have five petals, whereas the flowers of cultivated roses are often double (i.e., with multiple sets of petals). Rose flowers’ size ranges from tiny miniatures 1.25 cm (0.5 inch) in diameter to hybrid flowers measuring more than 17.5 cm (7 inches) across. The rose plant’s fleshy, sometimes edible, berrylike “fruit” (actually the floral cup) is known as a hip and usually ranges from red to orange in colour.',
        imageUrl:
            'https://www.enwallpaper.com/wp-content/uploads/2021/10/8c82f5da07d18f591727fc4325134e0b.jpg',
        scientificName: 'Rosa'),
    Plants(
        name: 'Daffodil',
        description:
            'Daffodils are native to northern Europe and are grown in temperate climates around the world daffodil, (Narcissus pseudonarcissus), also called common daffodil or trumpet narcissus, bulb-forming plant in the amaryllis family (Amaryllidaceae), widely cultivated for its trumpetlike flowers. Daffodils are native to northern Europe and are grown in temperate climates around the world. The daffodil’s popularity has resulted in the production of many varieties; in addition to the classic yellow form, the trumpet and petals may themselves be of contrasting yellow, white, pink, or orange.The daffodil is a perennial and grows to about 41 cm 16 inches in height. Each plant features five or six linear leaves that grow from the bulb and are about 30 cm 12 incheslong. The stem bears one large yellow blossom with a corolla deeply cleft into six lobes and a central bell-shaped crown, or corona, that is frilled at its edges. This trumpet shape contains the stamens and is the flowers most conspicuous feature.. ',
        imageUrl:
            'https://images.unsplash.com/photo-1613051035664-ec09d4cc9a6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGRhZmZvZGlsfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
        scientificName: 'Narcissus'),
    Plants(
        name: 'Aster',
        description:
            'Aster is a genus of perennial flowering plants in the family Asteraceae.  Its circumscription has been narrowed, and it now encompasses around 170 species, all but one of which are restricted to Eurasia; many species formerly in Aster are now in other genera of the tribe Astereae. ',
        imageUrl: 'https://wallpapercave.com/wp/wp7796033.jpg',
        scientificName: 'Aster'),
    Plants(
        name: 'Azalea',
        description:
            'Azaleas are flowering shrubs in the genus Rhododendron, particularly the former sections Tsutsuji and Pentanthera. Azaleas bloom in the spring, their flowers often lasting several weeks. Shade tolerant, they prefer living near or under trees. They are part of the family Ericaceae.',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/0062/8532/8445/products/Red_Ruffles_Azalea_5_grande.jpg?v=1609876153',
        scientificName: 'Rhododendron'),
    Plants(
        name: 'Black-Eyed Susan',
        description:
            'Rudbeckia hirta, commonly called black-eyed Susan, is a North American flowering plant in the family Asteraceae, native to Eastern and Central North America and naturalized in the Western part of the continent as well as in China.',
        imageUrl:
            'https://www.edenbrothers.com/store/media/Seeds-Mixes/Duo-Echinacea-Black-Eyes-Susan-2.jpg',
        scientificName: 'Rudbeckia hirta'),
    Plants(
        name: 'California Poppy',
        description:
            'Eschscholzia californica, the California poppy, golden poppy, California sunlight or cup of gold, is a species of flowering plant in the family Papaveraceae, native to the United States and Mexico.',
        imageUrl:
            'https://cdn.shopify.com/s/files/1/2084/6123/products/SW260-orange_poppy_close_1024x1024.jpg?v=1556557310',
        scientificName: 'Eschscholzia californica'),
    Plants(
        name: 'Chrysanthemum',
        description:
            'Chrysanthemums, sometimes called mums or chrysanths, are flowering plants of the genus Chrysanthemum in the family Asteraceae. They are native to East Asia and northeastern Europe. Most species originate from East Asia and the center of diversity is in China.',
        imageUrl:
            'https://www.edenbrothers.com/store/media/Seeds-Mixes/Duo-Echinacea-Black-Eyes-Susan-2.jpg',
        scientificName: 'Chrysanthemums'),
  ];*/
  List<Plant> plantList = [];
  @override
  void initState(){
    getPlantApi();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "What are you looking for?",
                    hintStyle: TextStyle(color: AppColors.secondaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon:
                        Icon(Icons.search, color: AppColors.secondaryColor),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: EdgeInsets.all(15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    suffixIcon: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: MaterialButton(
                  height: 55,
                  minWidth: 60,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.grey.shade200,
                  onPressed: () {},
                  child: Icon(Iconsax.settings),
                ),
              ),
              MaterialButton(
                height: 55,
                minWidth: 60,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: AppColors.primaryColor,
                onPressed: () {},
                child: Icon(
                  Iconsax.add,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: plantList.isEmpty? Center(child: CircularProgressIndicator()): GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: plantList.length,
                  itemBuilder: (context, index) =>
                      plantListCard(plant: plantList[index]))),
        ],
      ),
    );
  }

  plantListCard({required Plant plant}) {
    return GestureDetector(
   onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => PlantDetailScreen(
     plant: plant,
   ),)),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          10,
          10,
          10,
          15,
        ),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Expanded(
                child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                          getImageUrl(plant.photo!)
                          ,
                          fit: BoxFit.cover,
                        )))),
            SizedBox(
              height: 10,
            ),
            Text(
              plant.name!,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              plant.category!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
  getPlantApi() async {
    var r = await ApiServices().get(ApiUrl.baseUrl + ApiUrl.plants );
    Plantlist response = Plantlist.fromJson(r);
    setState(() {
    plantList = response.plantList!;
    isLoading = false;
    });
  }
  String getImageUrl(String photoName){
    return '${ApiUrl.baseUrl}${ApiUrl.photos}${photoName}';
  }
}
