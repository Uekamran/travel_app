import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/widgets/destination_carosoule.dart';
import 'package:travel_app/widgets/hotel_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _currentTab = 0;

  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];
  Widget _buildIcons(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
        print(_selectedIndex);
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            color:
                _selectedIndex == index ? Color(0xffd8ecf1) : Color(0xFFE7EbEE),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          _icons[index],
          size: 30,
          color:
              _selectedIndex == index ? Color(0xff3ebace) : Color(0xFFb4c1c4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: [
            Padding(
              padding: EdgeInsets.only(right: 90, left: 30),
              child: Text(
                "What would you like to find?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:
                  // _buildIcons(0),
                  // _buildIcons(1),
                  // _buildIcons(2),
                  // _buildIcons(3),
                  _icons
                      .asMap()
                      .entries
                      .map(
                        (MapEntry map) => _buildIcons(map.key),
                      )
                      .toList(),
            ),
            SizedBox(height: 20),
            DestinationCarosoule(),
            SizedBox(height: 20),
            HotelCarousel(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: (int value) {
            setState(() {
              _currentTab = value; 
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage('assets/images/venice.jpg'),
              ),
              label: '',
            ),
          ]),
    );
  }
}
