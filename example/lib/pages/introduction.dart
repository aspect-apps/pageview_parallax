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
              'FlutterParallaxChild',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Container(
                    width: width,
                    child: Text(
                        'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Deserunt fugit qui velit facilis officiis saepe pariatur voluptates atque dolor nobis illum nihil quisquam a, voluptatum illo. Quidem facilis non dolor!',
                        style: TextStyle(
                          fontSize: width < 1100 ? 15 : width / 60,
                        ),
                      ),
                    
                  ),
                       ),
          )
        ],
      ),
    );
  }
}
