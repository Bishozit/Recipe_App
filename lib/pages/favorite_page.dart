import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_app/constant/app_colors.dart';
import 'package:food_app/providers/homeprovider.dart';

class FavoritePage extends StatefulWidget {
  //static const String routeName = '/favorite';
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late HomePageProvider homePageProvider;

  void didChangeDependencies() {
    homePageProvider = Provider.of<HomePageProvider>(context);

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("My Favorite"),
        ),
        body: ListView.builder(
            itemCount: homePageProvider.favoriteMeals.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1, color: AppColors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tileColor: AppColors.black,
                  title:
                      Text("${homePageProvider.favoriteMeals[index].strMeal}"),
                ),
              );
            }));
  }
}
