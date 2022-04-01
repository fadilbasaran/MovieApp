import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../constants.dart';
import '../../../models/movie.dart';
import 'movie_card.dart';

class MovieCarousel extends StatefulWidget {
  const MovieCarousel({Key? key}) : super(key: key);

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  late final PageController _pageController;
  int initialPage = 0;
  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage,
    );

    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: 0.85,
        child: PageView.builder(
            onPageChanged: ((value) {
              setState(() {
                initialPage = value;
              });
            }),
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            itemCount: movies.length,
            itemBuilder: (context, index) => _buildMovieSlider(index)),
      ),
    );
  }

  Widget _buildMovieSlider(int index) => AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 0;
        if (_pageController.position.haveDimensions) {
          value = index - _pageController.page!;
          value = (value * 0.038).clamp(-1, 1);
        }
        return AnimatedOpacity(
          duration: const Duration(microseconds: 350),
          opacity: initialPage == index ? 1 : 0.4,
          child: Transform.rotate(
            angle: math.pi * value,
            child: MovieCard(
              movie: movies[index],
            ),
          ),
        );
      });
}
