import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:promilo_assignment/second_screen.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(context, 'Description'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CarouselSlider(
                options: CarouselOptions(autoPlay: false, enlargeCenterPage: true, aspectRatio: 1, viewportFraction: 1.0),
                items: [
                  'assets/c1.jpg',
                  'assets/c1.jpg',
                  'assets/c1.jpg',
                  'assets/c1.jpg',
                  'assets/c1.jpg',
                ]
                    .map(
                      (item) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 64,
                          height: MediaQuery.of(context).size.width - 64,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(item), fit: BoxFit.cover),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: Colors.grey[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(icon: const Icon(Icons.download), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.favorite_border), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.crop_free), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.star_border), onPressed: () {}),
                      IconButton(icon: const Icon(Icons.share), onPressed: () {}),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(children: [Icon(Icons.bookmark_border, color: Colors.lightBlue[900], size: 16), const SizedBox(width: 4), const Text('1034')]),
                  const SizedBox(width: 20),
                  Row(children: [Icon(Icons.favorite_border, color: Colors.lightBlue[900], size: 16), const SizedBox(width: 4), const Text('1034')]),
                  const SizedBox(width: 20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: const Row(
                        children: [
                          Icon(Icons.star, color: Colors.blue, size: 16),
                          Icon(Icons.star, color: Colors.blue, size: 16),
                          Icon(Icons.star, color: Colors.blue, size: 16),
                          Icon(Icons.star, color: Colors.blue, size: 16),
                          Icon(Icons.star, color: Colors.white, size: 16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text('3.2'),
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Actor Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Indian Actress'),
                  SizedBox(height: 5),
                  Row(children: [Icon(Icons.access_time, size: 17), SizedBox(width: 4), Text('Duration 20 Mins')]),
                  SizedBox(height: 5),
                  Row(children: [Icon(Icons.account_balance_wallet, size: 17), SizedBox(width: 4), Text('Total Average Fees ₹9,999')]),
                ],
              ),
              const SizedBox(height: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('About', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  SizedBox(height: 8),
                  Text(
                    'From cardiovascular health to fitness, flexibility, balance, stress relief, better sleep, increased cognitive performance, and more, you can reap all of these benefits in just one session out on the waves. So, you may find yourself wondering what are the benefits of going on a surf camp.',
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('See More', style: TextStyle(color: Colors.blue, fontSize: 16)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
