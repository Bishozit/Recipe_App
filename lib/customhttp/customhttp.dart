import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:food_app/models/mealsmodel.dart';

class CustomHttpRequest {
  static Future<dynamic> allMeals() async {
    MealsModel? mealsModel;
    const url = "https://www.themealdb.com/api/json/v1/1/search.php?f=a";

    try {
      final response = await http.get(
        Uri.parse(url),
      );
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        mealsModel = MealsModel.fromJson(data);
        print("Successfully Run");
      }
      return mealsModel!;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
