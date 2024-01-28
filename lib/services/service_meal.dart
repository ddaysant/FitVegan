

// import 'dart:convert';
// import 'dart:io';
// import 'package:http/http.dart' as http;

// import '../model/meal_plan_model.dart';
// import '../model/recipe_model.dart';

// class ApiService {
//   ApiService._instantiate();
//   static final ApiService instance = ApiService._instantiate();

//   final String _baseURL = "api.spoonacular.com";
//   static const String API_KEY = "aa73b68782ec4ec18679121cd23b1450";

//   Future<MealPlan> generateMealPlan(
//       {required int targetCalories, String? diet}) async {
  
//     String normalizedDiet = diet ?? ''; 
//     Map<String, String> parameters = {
//       'timeFrame': 'day',
//       'targetCalories': targetCalories.toString(),
//       'diet': normalizedDiet,
//       'apiKey': API_KEY,
//     };

//     Uri uri = Uri.https(
//       _baseURL,
//       '/recipes/mealplans/generate',
//       parameters,
//     );

//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };

//     try {
//       var response = await http.get(uri, headers: headers);
//       Map<String, dynamic> data = json.decode(response.body);
//       MealPlan mealPlan = MealPlan.fromMap(data);
//       return mealPlan;
//     } catch (err) {
//       throw err.toString();
//     }
//   }

//   Future<Recipe> fetchRecipe(String id) async {
//     Map<String, String> parameters = {
//       'includeNutrition': 'false',
//       'apiKey': API_KEY,
//     };

//     Uri uri = Uri.https(
//       _baseURL,
//       '/recipes/$id/information',
//       parameters,
//     );

//     Map<String, String> headers = {
//       HttpHeaders.contentTypeHeader: 'application/json',
//     };

//     try {
//       var response = await http.get(uri, headers: headers);
//       Map<String, dynamic> data = json.decode(response.body);
//       Recipe recipe = Recipe.fromMap(data);
//       return recipe;
//     } catch (err) {
//       throw err.toString();
//     }
//   }
// }
