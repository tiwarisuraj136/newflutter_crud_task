import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newflutter_crud_task/core/model/item_model.dart';
import 'package:newflutter_crud_task/features/Items/controller/items_add_controller.dart';

class ItemsAddPage extends GetView<ItemsAddController>{
  const ItemsAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form with Validation')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: controller.validateName,
              ),
              TextFormField(
                controller: controller.percentageController,
                decoration: const InputDecoration(labelText: 'Percentage'),
                keyboardType: TextInputType.number,
                validator: controller.validatePercentage,
              ),
              TextFormField(
                controller: controller.passoutYearController,
                decoration: const InputDecoration(labelText: 'Passout Year'),
                keyboardType: TextInputType.number,
                validator: controller.validatePassoutYear,
              ),
              TextFormField(
                controller: controller.cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: controller.validateCity,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (controller.nameController.text.isNotEmpty) {
                    print('hello i am here line 31');
                    ItemModel newItem = ItemModel(
                        id: '',
                        name: controller.nameController.text,
                        percentage: controller.percentageController.text,
                        passOutYear: int.parse(controller.passoutYearController.text),
                        city: controller.cityController.text,
                        isDone: false);

                    await controller.addData(newItem);

                    Get.snackbar('successful', 'add  Item successful form');


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
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

}