import 'package:flutter/material.dart';
import 'package:movie_info_app/constants.dart';
import 'package:movie_info_app/models/movie.dart';

import 'components/backdrop_rating.dart';
import 'components/genres_details.dart';
import 'components/title_duration_and_favbtn.dart';

class BodyDetails extends StatelessWidget {
  final Movie movie;
  const BodyDetails({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
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
    );
  }
}

class CastAndCrew extends StatelessWidget {
  final List casts;
  const CastAndCrew({Key? key, required this.casts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Column(
        children: [
          Text(
            'Cast & Crew',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: kDefaultPadding / 2,
          ),
          SizedBox(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(),
              itemCount: casts.length,
            ),
          ),
        ],
      ),
    );
  }
}

class CastCard extends StatelessWidget {
  final Map cast;
  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: kDefaultPadding),
      width: 80,
      child: Column(
        children: [
          Container(
            height: 80,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(cast['image']))),
          )
        ],
      ),
    );
  }
}
