import 'package:carousel_slider/carousel_slider.dart';
import 'package:jramogh/config/assets.dart';
import 'package:flutter/material.dart';
// import 'dart:html' as html;

class AboutTab extends StatelessWidget {
  // How far is page from being displayed
  final double offset;

  const AboutTab({Key key, this.offset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = <String>['Flutter Parallax', 'Flutter Parallax'];

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20),
            Text(
              'Hello! Welcome to',
              textScaleFactor: 3,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            IgnorePointer(
              child: Container(
                height: 45,
                width: double.infinity,
                child: CarouselSlider(
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.vertical,
                    autoPlay: true,
                    viewportFraction: 1,
                    autoPlayCurve: Curves.easeOutCubic,
                    autoPlayInterval: Duration(milliseconds: 1300),
                  ),
                  items: list
                      .map((item) => Container(
                            child: Center(
                              child: Text(
                                item,
                                style: Theme.of(context).textTheme.caption,
                                textScaleFactor: 3,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
