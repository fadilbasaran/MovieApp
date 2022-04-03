import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/movie.dart';
import '../../home/components/genre_card.dart';

class Genres extends StatelessWidget {
  const Genres({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          itemCount: movie.genra!.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GenresCard(
            genre: movie.genra![index],
          ),
        ),
      ),
    );
  }
}
