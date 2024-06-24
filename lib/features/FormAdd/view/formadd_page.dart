import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter_crud_task/core/model/todo_model.dart';
import 'package:newflutter_crud_task/core/routes_constant.dart';
import 'package:newflutter_crud_task/features/FormAdd/controller/formadd_controller.dart';

class FormAddPage extends GetView<FormAddController>{
  const FormAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller.contentController,
              decoration: const InputDecoration(
                labelText: 'Data Content',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (controller.contentController.text.isNotEmpty) {
                  print('hello i am here line 31');
                  HrmModel newHrmData = HrmModel(
                      id: '',
                      content: controller.contentController.text,
                      createdOn: Timestamp.now(),
                      isDone: false);
                  // await controller.addData(newHrmData);
                /*  HrmModel newHrmData = HrmModel(
                      id: '',
                      content: controller.contentController.text,
                      createdOn: Timestamp.now(),
                      isDone: false);
                  await controller.addData(newHrmData);*/
                  Get.snackbar('successful', 'add successful form');

                 /* HrmModel newHrmData = HrmModel(
                    id: '', // Firestore will generate this
                    content: controller.contentController.text,
                    createdOn: Timestamp.now(),
                    isDone: false,
                  );*/

                   // await controller.addData(newHrmData);

                  Get.back(); // Close the add todo page
                } else {
                  Get.snackbar(
                    'Error',
                    'Content cannot be empty',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: const Text('Add Data'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(RoutesConstant.item);
        },
        child: const Icon(Icons.ac_unit_rounded),
      ),
    );
  }

}