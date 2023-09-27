import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:food_app/constant/app_colors.dart';
import 'package:food_app/models/mealsmodel.dart';
import 'package:food_app/providers/homeprovider.dart';

List<String> favoriteMeals = [];

class DetailsPage extends StatefulWidget {
  static const String routeName = '/details';
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Meals meals;
  late HomePageProvider homePageProvider;

  void didChangeDependencies() {
    final argList = ModalRoute.of(context)!.settings.arguments as List;
    meals = argList[0];
    homePageProvider = Provider.of<HomePageProvider>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isFavorite = homePageProvider.isFavorite(meals);

    return Scaffold(
      appBar: AppBar(
        title: Text("${meals.strMeal} Details"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0.r),
                child: Stack(
                  children: [
                    Image.network(
                      "${meals.strMealThumb}",
                      height: 220.h,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: IconButton(
                          icon: Icon(isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border_outlined),
                          color: isFavorite ? AppColors.red : null,
                          onPressed: () {
                            homePageProvider.toggleFavorite(meals);
                            setState(() {});
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  const Text(
                    "Category : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text(
                    "${meals.strCategory}",
                    style: const TextStyle(fontSize: 25),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Area : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text("${meals.strArea}",
                      style: const TextStyle(fontSize: 25)),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Ingredient1 : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text("${meals.strIngredient1}",
                      style: const TextStyle(fontSize: 25)),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Ingredient2 : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text("${meals.strIngredient2}",
                      style: const TextStyle(fontSize: 25)),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Ingredient3 : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text("${meals.strIngredient3}",
                      style: const TextStyle(fontSize: 25)),
                ],
              ),
              Row(
                children: [
                  const Text(
                    "Ingredient4 : ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Text("${meals.strIngredient4}",
                      style: const TextStyle(fontSize: 25)),
                ],
              ),
              const Text(
                "Instructions :",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Text("${meals.strInstructions}",
                  style: const TextStyle(fontSize: 25)),
            ],
          ),
        ),
      ),
    );
  }
}
