import 'package:flutter/material.dart';

import '../../../constants.dart';

class CastCard extends StatelessWidget {
  final Map cast;
  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(right: kDefaultPadding),
      width: size.width * 0.2,
      child: Column(
        children: [
          Container(
            height: size.height * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  cast['image'],
                ),
              ),
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            cast['orginalName'],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
            maxLines: 2,
          ),
          const SizedBox(height: kDefaultPadding / 4),
          Text(
            cast['movieName'],
            textAlign: TextAlign.center,
            style: const TextStyle(color: kTextLightColor),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
