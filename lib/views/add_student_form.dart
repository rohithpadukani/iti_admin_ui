import 'package:flutter/material.dart';

class AddStudentForm extends StatelessWidget {
  const AddStudentForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Text('Add New Student'),
              //name
              Row(
                children: [
                  const Text('Name: '),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: OutlineInputBorder(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
    );
  }
}
