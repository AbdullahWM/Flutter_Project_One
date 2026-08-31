import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_1/data/data.dart';
import 'package:project_1/screen/detail_screen.dart';
import 'package:project_1/model/city_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String query = "";
  int selectedIndex = 0;

  List<CityModel> cityList = [];
  void getData() {
    for (var item in places) {
      CityModel cityModel = CityModel.fromJson(item);
      cityList.add(cityModel);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    // only the cities whose name contains what was typed
    List<CityModel> filtered = cityList.where((city) {
      return city.name!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on_outlined),
        ),
        title: const Text(
          "Wejha",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person_outline)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
          const SizedBox(width: 8),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF1C4C7C),
        unselectedItemColor: const Color(0xFF9AA1A9),
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: height * 0.5,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  image: DecorationImage(
                    image: AssetImage("assets/photos/gradient.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x82000000),
                        Color(0x0D000000),
                        Color(0x00F4F4F4),
                        Color.fromARGB(255, 244, 244, 244),
                      ],
                      stops: [0.0, 0.55, 0.8, 1.0],
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ----- left number -----
                      SizedBox(
                        width: width * 0.22,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w300,
                                height: 1.0,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "VISITED",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: width * 0.4,
                        height: width * 0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white24, width: 9),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${cityList.length}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: width * 0.15,
                                fontWeight: FontWeight.w300,
                                height: 1.0,
                              ),
                            ),
                            const SizedBox(height: 6),
                            const Text(
                              "CITIES",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                letterSpacing: 2.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        width: width * 0.22,
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "3",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.w300,
                                height: 1.0,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "TO GO",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 1.8,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Positioned(
                left: width * 0.05,
                right: width * 0.05,
                bottom: 15,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        query = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Search a city ✨ ",
                      hintStyle: TextStyle(
                        color: Color(0xFF9AA1A9),
                        fontSize: 16,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF77808A),
                        size: 24,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 22),
                    ),
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.06),
            child: const Row(
              // pushes the arrows out to the edges
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.chevron_left, color: Color(0xFF8A8A8A), size: 26),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.explore_outlined,
                      color: Color(0xFF5A5A5A),
                      size: 19,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "TAP TO EXPLORE",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.4,
                        color: Color(0xFF5A5A5A),
                      ),
                    ),
                  ],
                ),
                Icon(Icons.chevron_right, color: Color(0xFF8A8A8A), size: 26),
              ],
            ),
          ),

          const SizedBox(height: 18),

          if (filtered.isEmpty)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.05,
                vertical: 30,
              ),
              child: const Text(
                "No cities match that search.",
                style: TextStyle(fontSize: 15, color: Color(0xFF77808A)),
              ),
            ),

          Column(
            children: List.generate(filtered.length, (index) {
              CityModel city = filtered[index];

              return Padding(
                padding: EdgeInsets.only(
                  left: width * 0.05,
                  right: width * 0.05,
                  bottom: 14,
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(18),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(city: city),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: const Color(0xFFE7EAEF)),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Image.asset(
                            city.image!,
                            width: width * 0.22,
                            height: width * 0.22,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: width * 0.22,
                                height: width * 0.22,
                                color: const Color(0xFFE3EAF2),
                                child: const Icon(
                                  Icons.photo_outlined,
                                  color: Color(0xFF77808A),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(width: 14),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                city.name!,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                city.description!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF77808A),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
