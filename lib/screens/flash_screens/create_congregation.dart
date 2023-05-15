import 'package:flutter/material.dart';
import 'package:min_assist/models/congregation.dart';
//import 'package:firebase_database/firebase_database.dart';

class CreateCongregationPage extends StatefulWidget {
  final void Function(Congregation) onCongregationCreated;
  final bool hasExistingCongregation;

  const CreateCongregationPage({
    Key? key,
    required this.onCongregationCreated,
    required this.hasExistingCongregation,
  }) : super(key: key);
  @override
  CreateCongregationPageState createState() => CreateCongregationPageState();
}

class CreateCongregationPageState extends State<CreateCongregationPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  // final DatabaseReference _congregationsRef =
  //     FirebaseDatabase.instance.ref().child('congregations');

  void _save() {
    if (_formKey.currentState!.validate()) {
      final congregation = Congregation(name: _name);
      widget.onCongregationCreated(congregation);//temporary will remove
      Navigator.of(context).pop();
      //TODO: change this to work with firebase remove lines that say remove (guide below)
      /* final congregationId = _congregationsRef.push().key;
      // congregation.setId(congregationId);
      // widget.onCongregationCreated(congregation);
      // _congregationsRef.child(congregationId!).set(congregation.toJson());*/
    }
  }

  @override
  Widget build(BuildContext context) {
    final dialogTitle = widget.hasExistingCongregation
        ? const Text('Edit Congregation')
        : const Text('Create Congregation');

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            dialogTitle,
            const SizedBox(
              height: 16,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Congregation Name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name for the congregation';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _name = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: _save,
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
