

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final HomeRepositoryProvider = Provider((ref) => HomeRepository());

class HomeRepository{
HomeRepository();



getCategory() async {
  final categoryUrlString = 'https://futursity.com/course/api/categories';
  Uri categoryUrl = Uri.parse(categoryUrlString);

  http.Response categoryData =await  http.get(categoryUrl);
  // print(categoryData.body);
  List CategoryList = jsonDecode(categoryData.body);

  return CategoryList;

  // print(CategoryList);



}

getTopCourse() async {
  final courseUrlString = 'https://futursity.com/course/api/top_courses';
  Uri courseUrl = Uri.parse(courseUrlString);

  http.Response courseData =await  http.get(courseUrl);
  // print(categoryData.body);
  List courseList = jsonDecode(courseData.body);

  return courseList;

  // print(CategoryList);



}

getData(){
  print('test');
}

}