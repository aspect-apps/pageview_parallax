import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

ValueNotifier<double> offset = ValueNotifier<double>(0);

class FlutterParallax extends StatefulWidget {
  final List<Widget> screens;
  final Axis scrollDirection;
  final ImageProvider backgroundImage;

  const FlutterParallax({
    Key key,
    @required this.screens,
    this.scrollDirection = Axis.vertical,
    this.backgroundImage,
  }) : super(key: key);

  static FlutterParallax of(BuildContext context) {
    //This method returns the current state of the ThemeSwitcherWidget. This will be used down the tree
    return context.findAncestorWidgetOfExactType();
  }

  @override
  _FlutterParallaxState createState() => _FlutterParallaxState();
}

class _FlutterParallaxState extends State<FlutterParallax> {
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 1);
    pageController.addListener(() {
      offset.value = pageController.page;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pageViewWidget = PageView(
      scrollDirection: widget.scrollDirection,
      children: widget.screens,
      pageSnapping: true,
      controller: pageController,
    );

    if (widget.backgroundImage is ImageProvider) {
      return ValueListenableBuilder<double>(
        valueListenable: offset,
        builder: (
          BuildContext context,
          double pageOffset,
          Widget child,
        ) {
          return Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: widget.backgroundImage,
                    alignment:
                        Alignment(0, pageOffset.abs() / widget.screens.length),
                    fit: BoxFit.none,
                    scale: 1,
                  ),
                ),
              ),
              pageViewWidget,
            ],
          );
        },
      );
    }

    return pageViewWidget;
  }
}

class FlutterParallaxChild extends StatefulWidget {
  final Widget child;

  const FlutterParallaxChild({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  _FlutterParallaxChildState createState() => _FlutterParallaxChildState();
}

class _FlutterParallaxChildState extends State<FlutterParallaxChild> {
  @override
  Widget build(BuildContext context) {
    final numberOfPages = FlutterParallax.of(context).screens.length;

    return ValueListenableBuilder<double>(
      valueListenable: offset,
      builder: (
        BuildContext context,
        double pageOffset,
        Widget child,
      ) {
        return Container(
          alignment: Alignment(
            -(numberOfPages) + numberOfPages * pageOffset.abs() - .75,
            -2.25 + 1.5 * pageOffset.abs(),
          ),
          child: widget.child,
        );
      },
    );
  }
}
