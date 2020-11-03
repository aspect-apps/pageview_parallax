import 'package:flutter/material.dart';

import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:jramogh/widgets/flutter_parallax.dart';

class Introduction extends StatelessWidget {
  final offset;

  const Introduction({Key key, this.offset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final controller = FadeInController(autoStart: true);

    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: <Widget>[
          FlutterParallaxChild(
            child: Text(
              'About Me',
              style: TextStyle(fontSize: 60),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: width / 3,
                    child: FadeIn(
                      // opacity: _visible ? 1.0 : 0.0,
                      controller: controller,
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.decelerate,
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Deserunt fugit qui velit facilis officiis saepe pariatur voluptates atque dolor nobis illum nihil quisquam a, voluptatum illo. Quidem facilis non dolor!',
                        style: TextStyle(
                          fontSize: width < 1100 ? 15 : width / 60,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: FadeIn(
                      duration: Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipOval(
                          child: Container(
                            width: width < 1100 ? 175 : width / 6,
                            child: Image.asset('assets/profile.png'),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
