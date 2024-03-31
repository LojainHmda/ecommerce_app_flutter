import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/announcement_model.dart';

class CustomCarousel extends StatefulWidget {
  final List<AnnouncementModel> announcement;
  const CustomCarousel({super.key, required this.announcement});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  late CarouselController _controller;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    _controller = CarouselController();
  }

  List<Widget> imageSliders() => widget.announcement
      .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: Image.network(item.imgUrl, fit: BoxFit.cover, width: 1000.0),
          )))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: imageSliders(),
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dummyAnnouncements.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Theme.of(context).primaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
