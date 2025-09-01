import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  Category({required this.title, required this.id, this.color = Colors.red});

  static List<Category> createDummy() {
    return [
      Category(
        id: "c1",
        title: "Pastries",
        color: Color.fromARGB(255, 244, 180, 94),
      ),
      Category(
        id: "c2",
        title: "Healthy",
        color: Color.fromARGB(255, 76, 175, 80),
      ),
      Category(
        id: "c3",
        title: "Breakfast",
        color: Color.fromARGB(255, 255, 202, 40),
      ),
      Category(
        id: "c4",
        title: "Pizzas",
        color: Color.fromARGB(255, 255, 87, 34),
      ),
      Category(
        id: "c5",
        title: "Soups",
        color: Color.fromARGB(255, 121, 85, 72),
      ),
      Category(
        id: "c6",
        title: "Spaghetti",
        color: Color.fromARGB(255, 233, 30, 99),
      ),
      Category(
        id: "c7",
        title: "Rice",
        color: Color.fromARGB(255, 0, 188, 212),
      ),
      Category(
        id: "c8",
        title: "Cocktails",
        color: Color.fromARGB(255, 156, 39, 176),
      ),
      Category(
        id: "c9",
        title: "Burgers",
        color: Color.fromARGB(255, 255, 152, 0),
      ),
      Category(
        id: "c10",
        title: "Salads",
        color: Color.fromARGB(255, 139, 195, 74),
      ),
      Category(
        id: "c11",
        title: "Desserts",
        color: Color.fromARGB(255, 255, 112, 67),
      ),
      Category(
        id: "c12",
        title: "Drinks",
        color: Color.fromARGB(255, 63, 81, 181),
      ),
    ];
  }
}
