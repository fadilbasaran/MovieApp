import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_svg/flutter_svg.dart';

import 'package:movie_info_app/constants.dart';
import 'package:movie_info_app/screens/home/components/body_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Body(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          padding: const EdgeInsets.only(left: kDefaultPadding),
          onPressed: () {},
          icon: SvgPicture.asset('assets/icons/menu.svg'),
        ),
        actions: <Widget>[
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            onPressed: () {},
            icon: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ],
      ),
    );
  }
}
