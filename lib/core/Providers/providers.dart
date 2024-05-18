import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryAPIProvider = Provider((ref) => 'https://futursity.com/course/api/categories');
final topCoursesAPIProvider = Provider((ref) => 'https://futursity.com/course/api/top_courses');