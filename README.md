This plugin for Flutter makes it easier for you to create a list with a parallax effect, providing several animations types and customizations options.

![](android.gif)

Please be advised: this package is currently under development and is not stable.

# Getting Started

Add this to your package's pubspec.yaml file:

```
dependencies:
  pageview_parallax: 1.0.0-alpha.2
```

# Usage

Simply import the package:

```
import 'package:pageview_parallax/pageview_parallax.dart';
```

To create a parallax effect, just use the `FlutterParallax` constructor, and pass your screens as a child of the `screens` parameter.

A minimal implementation would look like this:

```
  List<Widget> screens = <Widget>[
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterParallax(
        screens: screens,
        backgroundImage: NetworkImage(
          "https://www.richardtmoore.co.uk/wp-content/uploads/2016/10/btx-background-placeholder-03-1024x683.jpg",
        ),
      ),
    );
  }
```

If you'd like to add a child that move while the page scrolls, in one of your screens, just add a `FlutterParallaxChild`, and pass the child on the `child` property.

Using the example above:


```
List<Widget> screens = <Widget>[
    FlutterParallaxChild(
      child: Text("Hey, I can move!"),
    ),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterParallax(
        screens: screens,
        backgroundImage: NetworkImage(
          "https://www.richardtmoore.co.uk/wp-content/uploads/2016/10/btx-background-placeholder-03-1024x683.jpg",
        ),
      ),
    );
  }
```

Notice the child that was added at the `screens` array of Widgets.

There's a complete example project at the `/example` folder.
