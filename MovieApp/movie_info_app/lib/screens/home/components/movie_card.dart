import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_info_app/screens/detail/details_screen.dart';

import '../../../constants.dart';
import '../../../models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: OpenContainer(
        closedElevation: 0,
        openElevation: 0,
        closedBuilder: (context, action) => _buildMovieCard(context),
        openBuilder: (context, action) => DetailsScreen(movie: movie),
      ),
    );
  }

  Column _buildMovieCard(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: const [kDefaultShadow],
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(movie.poster!),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
          child: Text(
            movie.title!,
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/star_fill.svg'),
            const SizedBox(
              width: kDefaultPadding / 2,
            ),
            Text(
              '${movie.rating}',
              style: Theme.of(context).textTheme.bodyText2,
            )
          ],
        )
      ],
    );
  }
}
