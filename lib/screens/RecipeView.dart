// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'RecipDetail.dart';


class RecipeView extends StatefulWidget {
  const RecipeView({Key? key}) : super(key: key);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  List<Map<String, dynamic>> recipes = []; 

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    try {
     
      final response = await http.get(
        Uri.parse('https://api.spoonacular.com/recipes/complexSearch?diet=vegan&apiKey=aa73b68782ec4ec18679121cd23b1450'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> recipesData = data['results'];

        setState(() {
          recipes = recipesData.map((recipe) {
            return {
              'id': recipe['id'],
              'title': recipe['title'],
              'image': recipe['image'],
            };
          }).toList();
        });
      } else {
        print('Error loading recipes: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading recipes: $error');
    }
  }

  Future<Map<String, dynamic>> _loadRecipeDetails(int recipeId) async {
    try {
      final response = await http.get(
        Uri.parse('https://api.spoonacular.com/recipes/$recipeId/information?apiKey=aa73b68782ec4ec18679121cd23b1450'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> recipeDetails = json.decode(response.body);
        return recipeDetails;
      } else {
        print('Error loading recipe details: ${response.statusCode}');
        return {'error': 'Error loading recipe details'};
      }
    } catch (error) {
      print('Error loading recipe details: $error');
      return {'error': 'Error loading recipe details'};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vegan Recipes'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          var recipe = recipes[index];
          return GestureDetector(
            onTap: () async {
              Map<String, dynamic> recipeDetails = await _loadRecipeDetails(recipe['id']);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RecipeDetailsView(recipeDetails)),
              );
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 229, 241, 236),
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 2),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      recipe['image'],
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe['title'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}


