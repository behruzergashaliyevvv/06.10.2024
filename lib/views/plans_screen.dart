

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/plan_controller.dart';

class PlansScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final planController = Provider.of<PlanController>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Plans')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16, right: 16),
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
                ElevatedButton(
                  onPressed: () {
                    planController.addPlan(
                        titleController.text, descriptionController.text);
                  },
                  child: Text('Add Plan'),
                ),
              ],
            ),
          ),
          Expanded(
            child: planController.plans.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: planController.plans.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(planController.plans[index].title),
                        subtitle: Text(planController.plans[index].description),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            planController
                                .deletePlan(planController.plans[index].id);
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
