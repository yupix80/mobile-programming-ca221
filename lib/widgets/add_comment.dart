import 'package:flutter/material.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final _formKey = GlobalKey<FormState>();
  final _dataComment = {};

  void _saveComment() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      // Menyimpan masukan
      Navigator.of(context).pop(); // Tutup field komen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Comment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Creator'),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    hintText: 'Moment creator',
                    prefixIcon: const Icon(Icons.person),
                  ),
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter moment creator';
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      _dataComment['creator'] = newValue;
                    }
                  },
                ),
              const SizedBox(height: 16.0),
              const Text('Comment'),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Comment description',
                  prefixIcon: const Icon(Icons.comment),
                ),
                onSaved: (newValue) {
                  _dataComment['comment'] = newValue;
                },
              ),
              const SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: _saveComment,
                child: const Text('Send'),
              ),
              const SizedBox(height: 8.0),
              OutlinedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
