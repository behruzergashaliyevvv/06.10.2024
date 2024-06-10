import 'package:flutter/foundation.dart';
import 'package:uyishi/models/course.dart';

import '../services/api_service.dart';

class CourseController with ChangeNotifier {
  List<Course> _courses = [];

  List<Course> get courses => _courses;

  CourseController() {
    fetchCourses();
  }

  void fetchCourses() async {
    _courses = await ApiService.fetchCourses();
    notifyListeners();
  }

  void addCourse(String title, String description, String imageUrl, List<Lesson> lessons, double price) async {
    final newCourse = Course(
      id: DateTime.now().toString(),
      title: title,
      description: description,
      imageUrl: imageUrl,
      lessons: lessons,
      price: price,
    );
    _courses.add(newCourse);
    notifyListeners();
    await ApiService.saveCourse(newCourse);
  }

  void deleteCourse(String id) async {
    _courses.removeWhere((course) => course.id == id);
    notifyListeners();
    await ApiService.deleteCourse(id);
  }
}
