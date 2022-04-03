import 'package:flutter/material.dart';
import 'package:movie_info_app/constants.dart';
import 'package:movie_info_app/models/movie.dart';

import 'components/backdrop_rating.dart';
import 'components/cast_and_crew.dart';
import 'components/genres_details.dart';
import 'components/title_duration_and_favbtn.dart';

class BodyDetails extends StatelessWidget {
  final Movie movie;
  const BodyDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BackDropAndRating(size: size, movie: movie),
          const SizedBox(height: kDefaultPadding / 2),
          TitleDurationAndFabBtn(movie: movie),
          Genres(movie: movie),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: kDefaultPadding / 2,
              horizontal: kDefaultPadding,
            ),
            child: Text(
              'Plot Sumary',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text(
              movie.plot!,
              style: const TextStyle(color: Color(0xFF737599)),
            ),
          ),
          CastAndCrew(casts: movie.cast!),
        ],
      ),
    );
  }
}
