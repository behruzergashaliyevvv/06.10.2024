import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uyishi/views/course_video_page.dart';
import '../controllers/course_controller.dart';

class CourseScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final courseController = Provider.of<CourseController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Courses')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: imageUrlController,
                  decoration: InputDecoration(labelText: 'Image URL'),
                ),
                TextField(
                  controller: priceController,
                  decoration: InputDecoration(labelText: 'Price'),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    courseController.addCourse(
                      titleController.text,
                      descriptionController.text,
                      imageUrlController.text,
                      [], // For simplicity, we start with an empty lessons list
                      double.parse(priceController.text),
                    );
                  },
                  child: Text('Add Course'),
                ),
              ],
            ),
          ),
          Expanded(
            child: courseController.courses.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: courseController.courses.length,
                    itemBuilder: (context, index) {
                      final course = courseController.courses[index];
                      return ListTile(
                        leading: Image.network(course.imageUrl,
                            width: 50, height: 50, fit: BoxFit.cover),
                        title: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseVideoPage(),
                              ),
                            );
                          },
                          child: Text("${course.title}   <-    press"),
                        ),
                        subtitle:
                            Text('${course.description}\n\$${course.price}'),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            courseController.deleteCourse(course.id);
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
