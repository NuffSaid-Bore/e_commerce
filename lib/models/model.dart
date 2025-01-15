import 'package:flutter/material.dart';

class FappModel {
  String name;
  double rating;
  String image;
  double price;
  double review;
  List<String> size;
  bool isCheck;
  String category;
  String description;
  List<Color> fcolor;

FappModel({
  required this.name,
  required this.image,
  required this.rating,
  required this.price,
  required this.review,
  required this.fcolor,
  required this.size,
  required this.description,
  required this.isCheck,
  required this.category
  
});
}

List<FappModel> fashionEcommerce =[
  FappModel(
    name: 'Oversized Fit Printed Mesh T-SHirt', 
    image: '', 
    rating: 4.9, 
    price: 249, 
    review: 136, 
    fcolor: [
      Colors.black,
      Colors.blue,
      Colors.blue.shade100,

    ], 
    size: [
      'XS',
      'S',
      'M'
    ], 
    description: '', 
    isCheck: true, 
    category: 'Women'),

      FappModel(
    name: 'Fit Printed Mesh T-SHirt', 
    image: '', 
    rating: 3.9, 
    price: 149, 
    review: 136, 
    fcolor: [
      Colors.black,
      Colors.yellow,
      Colors.white,

    ], 
    size: [
      'XS',
      'S',
      'M'
    ], 
    description: '', 
    isCheck: false, 
    category: 'Kids'),

      FappModel(
    name: 'Oversized Mesh T-SHirt', 
    image: '', 
    rating: 4.1, 
    price: 549, 
    review: 136, 
    fcolor: [
      Colors.orange,
      Colors.red,
      Colors.blue.shade100,

    ], 
    size: [
      'XS',
      'S',
      'M'
    ], 
    description: '', 
    isCheck: true, 
    category: 'Men'),
      FappModel(
    name: 'Printed Mesh T-SHirt', 
    image: '', 
    rating: 4.9, 
    price: 249, 
    review: 136, 
    fcolor: [
      Colors.black45,
      Colors.purple,
      Colors.orange.shade100,

    ], 
    size: [
      'XS',
      'S',
      'M'
    ], 
    description: '', 
    isCheck: false, 
    category: 'Teen'),

      FappModel(
    name: 'Oversized Mesh T-SHirt', 
    image: '', 
    rating: 4.9, 
    price: 229, 
    review: 136, 
    fcolor: [
      Colors.white,
      Colors.black26,
      Colors.red.shade100,

    ], 
    size: [
      'XS',
      'S',
      'M'
    ], 
    description: '', 
    isCheck: true, 
    category: 'Men'),

      FappModel(
    name: 'Mesh T-SHirt', 
    image: '', 
    rating: 4.0, 
    price: 349, 
    review: 136, 
    fcolor: [
      Colors.orange,
      Colors.blue,
      Colors.grey.shade100,

    ], 
    size: [
      'XS',
      'S',
      'M'
    ], 
    description: '', 
    isCheck: false, 
    category: 'Baby'),
];