import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    // Navigator class helps to navigate between the screens
    // ther are 2 ways to navigate through pages
    // 1 -> push() creates the MaterialPageRoute object "on the fly" (i.e. in the place where you call push())
    // 2 -> whereas pushNamed() only works with pre-registered routes (in the routes table of your MaterialApp widget).
    // 1
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoryMealsScreen(id, title);
    //     },
    //   ),
    // 2 (cleaner approach)
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // we could have used GestureDectector to make this container clickable
    // but we used InkWell to get the ripple effect on tapping the container
    return InkWell(
      onTap: () => selectCategory(context),
      // the color of thee ripples
      splashColor: Theme.of(context).primaryColor,
      // borderRadius should be same as the borderRadius of the container
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
