import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:promilo_assignment/description_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBar(context, 'Individual Meetup'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.mic),
                  hintText: 'Search',
                  hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 25),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) => setState(() => _currentIndex = index),
                ),
                items: [
                  'assets/c1.jpg',
                  'assets/c1.jpg',
                  'assets/c1.jpg',
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(i),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage("assets/c1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [
                                      Colors.black.withOpacity(0.7),
                                      Colors.transparent,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 20, bottom: 15),
                              child: Text(
                                'Popular Meetups\nin India',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [0, 1, 2].map((i) {
                  return Container(
                    width: 9.0,
                    height: 9.0,
                    margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == i ? const Color.fromRGBO(0, 0, 0, 0.9) : const Color.fromRGBO(0, 0, 0, 0.4),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Trending Popular People',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        TrendingPopulorPeopleCard(),
                        TrendingPopulorPeopleCard(),
                        TrendingPopulorPeopleCard(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Top Trending Meetups',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildMeetupCard(),
                        _buildMeetupCard(),
                        _buildMeetupCard(),
                        _buildMeetupCard(),
                        _buildMeetupCard(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Prolet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.meeting_room),
            label: 'Meetup',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
      ),
    );
  }

  Widget _buildMeetupCard() {
    return InkWell(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen())),
      child: Container(
        width: 180,
        height: 180,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/c1.jpg')),
        ),
      ),
    );
  }
}

class TrendingPopulorPeopleCard extends StatelessWidget {
  const TrendingPopulorPeopleCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.grey,
                      child: Center(
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.create, size: 30, color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Author', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        Text('1,028 Meetups', style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 250, child: Divider(color: Colors.grey)),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/c1.jpg')),
                    Positioned(left: 35, child: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/c1.jpg'))),
                    Positioned(left: 70, child: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/c1.jpg'))),
                    Positioned(left: 105, child: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/c1.jpg'))),
                    Positioned(left: 140, child: CircleAvatar(radius: 24, backgroundImage: AssetImage('assets/c1.jpg'))),
                  ],
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15, right: 15),
          child: SizedBox(
            height: 28,
            width: 80,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                backgroundColor: Colors.lightBlue[900],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('See more', style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ],
    );
  }
}

AppBar commonAppBar(BuildContext context, String title) {
  return AppBar(
    leading: InkWell(onTap: () => Navigator.pop(context), child: const Icon(Icons.arrow_back_ios_new, size: 20)),
    backgroundColor: Colors.white,
    titleSpacing: 0,
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    elevation: 1,
    shadowColor: Colors.grey,
  );
}
