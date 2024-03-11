import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class MealDetailScreen extends StatefulWidget {
  final Map<String, dynamic> category;
  const MealDetailScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  File? _image;

  void updateDetails() {
    setState(() {
      widget.category['name'] = _nameController.text;
      widget.category['description'] = _descriptionController.text;
      if (_image != null) {
        widget.category['imageUrl'] = _image!.path;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category['name']);
    _descriptionController =
        TextEditingController(text: widget.category['description']);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  // void _editDetails() {
  //   setState(() {
  //     widget.category['name'] = _nameController.text;
  //     widget.category['description'] = _descriptionController.text;
  //     if (_image != null) {
  //       widget.category['imageUrl'] = _image!.path;
  //     }
  //   });
  // }

  Future<void> _editDetails() async {
    final url =
        Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php');
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          // 'idCategory' :
          'strCategory': widget.category['name'],
          'strCategoryThumb': widget.category['_image']
        }),
      );
      // print('Status Code: ${response.statusCode}');
      if (response.statusCode == 200) {
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to make the API request.'),
          ),
        );
      }
    } catch (e) {
      // print('Exception when fetching users: $e');
    }
  }

  Future<void> _getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category['name']),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: _image != null
                    ? Image.file(_image!)
                    : Image.network(widget.category['imageUrl']),
              ),
              ElevatedButton(
                onPressed: _getImage,
                child: Text(_image != null ? 'Change Image' : 'Upload Image'),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          child: AlertDialog(
                            title: const Text('Edit Details'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                _image != null
                                    ? Image.file(_image!)
                                    : Image.network(
                                        widget.category['imageUrl']),
                                ElevatedButton(
                                  onPressed: _getImage,
                                  child: Text(_image != null
                                      ? 'Change Image'
                                      : 'Select Image'),
                                ),
                                const SizedBox(height: 16),
                                TextField(
                                  controller: _descriptionController,
                                  decoration: const InputDecoration(
                                    labelText: 'Description',
                                    border: OutlineInputBorder(),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _editDetails();
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Save'),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
