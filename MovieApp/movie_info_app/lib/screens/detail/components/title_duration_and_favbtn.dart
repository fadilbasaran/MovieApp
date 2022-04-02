import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/movie.dart';

class TitleDurationAndFabBtn extends StatelessWidget {
  const TitleDurationAndFabBtn({Key? key, required this.movie})
      : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title!,
                  style: Theme.of(context).textTheme.headline5,
                ),
                const SizedBox(height: kDefaultPadding / 2),
                Row(
                  children: [
                    Text(
                      '${movie.year}',
                      style: const TextStyle(color: kTextLightColor),
                    ),
                    const SizedBox(width: kDefaultPadding / 2),
                    const Text(
                      'PG-13',
                      style: TextStyle(color: kTextLightColor),
                    ),
                    const SizedBox(width: kDefaultPadding / 2),
                    const Text(
                      '2h 32min',
                      style: TextStyle(color: kTextLightColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Icon(Icons.add),
            ),
          )
        ],
      ),
    );
  }
}
