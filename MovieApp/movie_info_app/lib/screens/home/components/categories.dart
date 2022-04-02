import 'package:flutter/material.dart';
import 'package:movie_info_app/constants.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

//We need stateful widget because we need to change some sate on category
class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;
  List<String> categories = ['In Theater', 'Box Office', 'Coming Soon'];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      height: size.height * 0.08,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCategories(index, context);
        },
      ),
    );
  }

  Padding _buildCategories(int index, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedCategory = index;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: index == selectedCategory
                        ? kTextColor
                        : Colors.black.withOpacity(0.4),
                  ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              height: size.height * 0.009,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                    ? kSecondaryColor
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
