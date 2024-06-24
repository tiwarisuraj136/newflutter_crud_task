import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter_crud_task/core/routes_constant.dart';
import 'home_page_controller.dart';

class HomePageView extends GetView<HomeController> {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.allInfo.length,
            itemBuilder: (context, index) {
              final student = controller.allInfo[index];
              return ListTile(
                leading: Checkbox(
                  value: student.isDone, // Assuming each student has an `isSelected` field
                  onChanged: (bool? value) {
                    // Update the selected state
                    // student.isDone = value!;
                    controller.updateStatus(value!,student.id);
                  },
                ),
                title: Text("Name: ${student.name}"),
                subtitle: Text(
                  'Percentage: ${student.percentage}%\n'
                      'Last Year Passout: ${student.passOutYear}\n'
                      'City: ${student.city}',
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    controller.deleteHrmData(student.id);
                  },
                ),
              );
            },
          );
        }
      }),


        floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(RoutesConstant.item);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}