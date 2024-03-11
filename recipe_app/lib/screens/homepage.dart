// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, duplicate_ignore

import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recipe_app/datamodel/recipemodel.dart';
// import 'package:shared_preferences/shared_preferences.dart'; // Import Firestore

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser;
  List<Map<String, dynamic>> fetchedData = [];
  String? _selectedRole;
  List<String> roles = ['Admin', 'Sr. Developer', 'Jr. Developer'];
  late List<Users> _users = [];
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _UserIdController = TextEditingController();
  final TextEditingController _NameController = TextEditingController();
  final TextEditingController _EmailIdController = TextEditingController();
  final TextEditingController _UserNameController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final TextEditingController _RoleController = TextEditingController();
  final TextEditingController _AddUserIdController = TextEditingController();
  final TextEditingController _AddNameController = TextEditingController();
  final TextEditingController _AddEmailIdController = TextEditingController();
  final TextEditingController _AddUserNameController = TextEditingController();
  final TextEditingController _AddPasswordController = TextEditingController();
  final TextEditingController _AddRoleController = TextEditingController();

  bool _isPasswordVisible = false;

  void submitAddUser() async {
    if (_formKey.currentState!.validate()) {
      String userId = _AddUserIdController.text;
      String name = _AddNameController.text;
      String userEmail = _AddEmailIdController.text;
      String userName = _AddUserNameController.text;
      String password = _AddPasswordController.text;
      String role = _AddRoleController.text;

      await AddUserData(userId, name, userEmail, userName, password, role);
      setState(() {
        fetchUserData().then((users) {
          setState(() {
            _users = users;
          });
        }).catchError((error) {
          // print("Error fetching users: $error");
        });
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Added')),
      );

      Navigator.pop(context);
    }
  }

  void submitEditUser() async {
    if (_formKey.currentState!.validate()) {
      String userId = _UserIdController.text;
      String name = _NameController.text;
      String userEmail = _EmailIdController.text;
      String userName = _UserNameController.text;
      String password = _PasswordController.text;
      String role = _RoleController.text;

      await EditUserData(userId, name, userEmail, userName, password, role);
      setState(() {
        fetchUserData().then((users) {
          setState(() {
            _users = users;
          });
        }).catchError((error) {
          // print("Error fetching users: $error");
        });
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User Edited')),
      );
      Navigator.pop(context);
    }
  }

  Future<void> deleteUserById(String userId) async {
    final url = Uri.parse('https://skyi-com.onrender.com/user/$userId');
    try {
      final response = await http.delete(url);
      if (response.statusCode == 200) {
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Failed to delete the user.'),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while deleting the user.'),
        ),
      );
    }
  }

  Future<void> EditUserData(String userId, String name, String userEmail,
      String userName, String password, String role) async {
    final url = Uri.parse('https://skyi-com.onrender.com/user/$userId');
    try {
      final response = await http.put(
        url,
        body: jsonEncode({
          'userId': userId,
          'name': name,
          'email': userEmail,
          'username': userName,
          'password': password,
          'role': role
        }),
      );
      if (response.statusCode == 200) {
      } else {
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

  Future<void> AddUserData(String userId, String name, String userEmail,
      String userName, String password, String role) async {
    final url = Uri.parse('https://skyi-com.onrender.com/user');
    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'userId': userId,
          'name': name,
          'email': userEmail,
          'username': userName,
          'password': password,
          'role': role
        }),
      );
      if (response.statusCode == 201) {
      } else {
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

  signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   // fetchMeals();
  //   fetchUserData();
  // }

  @override
  void initState() {
    super.initState();
    fetchUserData().then((users) {
      setState(() {
        _users = users;
      });
    }).catchError((error) {
      // print("Error fetching users: $error");
    });
  }

  // Future<void> fetchMeals() async {
  //   // const url = 'https://www.themealdb.com/api/json/v1/1/categories.php';
  //   const url = 'https://skyi-com.onrender.com/user';
  //   final uri = Uri.parse(url);
  //   var response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     setState(() {
  //       fetchedData = List<Map<String, dynamic>>.from(
  //         // json['categories'].map((x) => {
  //         //       'name': x['strCategory'],
  //         //       'imageUrl': x['strCategoryThumb'],
  //         //       'description': x['strCategoryDescription'],
  //         //     }),
  //       );
  //     });
  //     // Add fetched data to Firestore
  //     // await addFetchedDataToFirestore(fetchedData);
  //   } else {
  //     // Handle error
  //     // print('Failed to fetch data');
  //   }
  // }

  Future<List<Users>> fetchUserData() async {
    try {
      final response =
          await http.get(Uri.parse('https://skyi-com.onrender.com/user'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse.map((user) => Users.fromJson(user)).toList();
      } else {
        throw Exception(
            'Failed to load users with status code ${response.statusCode}');
      }
    } catch (e) {
      // print('Exception when fetching users: $e');

      return Future.value([]);
    }
  }

  Future<void> addFetchedDataToFirestore(
      List<Map<String, dynamic>> data) async {
    final CollectionReference collection =
        FirebaseFirestore.instance.collection('meals');
    // ignore: avoid_function_literals_in_foreach_calls
    data.forEach((meal) async {
      await collection.add(meal);
    });
  }

  // ignore: duplicate_ignore, duplicate_ignore
  Future<void> addNewMeal() async {
    setState(() {
      fetchedData.add({
        'name': 'New Meal',
        'imageUrl': '',
        'description': 'Description of the new meal',
      });
    });

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('New meal added!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (() => signOut()),
          icon: const Icon(Icons.logout_outlined),
        ),
        title: const Text('Users'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                  enableDrag: true,
                  isDismissible: false,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  backgroundColor: Colors.white,
                  context: context,
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 0,
                              ),
                              InputDecorator(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Add User",
                                  labelStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () => Navigator.pop(context),
                                    icon: const Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(
                                color: Colors.black,
                                thickness: 2,
                                indent: 5,
                                endIndent: 5,
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                controller: _AddUserIdController,
                                decoration: InputDecoration(
                                  labelText: 'user Id ',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please Enter User Id';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                controller: _AddNameController,
                                decoration: InputDecoration(
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                controller: _AddEmailIdController,
                                decoration: InputDecoration(
                                    labelText: 'Email Id',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else if (GetUtils.isEmail(
                                      _EmailIdController.text)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                controller: _AddUserNameController,
                                decoration: InputDecoration(
                                    labelText: 'User Name ',
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter user name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              TextFormField(
                                controller: _AddPasswordController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  labelText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _isPasswordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isPasswordVisible =
                                            !_isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: !_isPasswordVisible,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                              DropdownButtonFormField<String>(
                                value: _selectedRole,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedRole = newValue;
                                  });
                                },
                                decoration: InputDecoration(
                                  labelText: 'Role',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fillColor:
                                      Colors.grey[200], // Background color
                                  // filled: true,
                                ),
                                items: roles.map((role) {
                                  return DropdownMenuItem(
                                    value: role,
                                    child: Text(role),
                                  );
                                }).toList(),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select your Role';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 50,
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    submitAddUser();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.indigo,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  child: const Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 16.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _users.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = _users[index];
                  return Card(
                    color: Colors.white70,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 10.0,
                                right: 15.0,
                                bottom: 10.0),
                            child: const SizedBox(
                              width: 60.0,
                              height: 60.0,
                              child: CircleAvatar(backgroundImage: NetworkImage(
                                  // "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYKGTck-VTPHenx9vKVnn06pyTu2G1GwQJBlwXAl7nU814ehEwPF3NdhsXH-1WXLFaZ7s&usqp=CAU"),
                                  'https://i.pravatar.cc/150?u=fake@pravatar.com')),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("User Id: ${user.id}"),
                                Text("Name: ${user.name}"),
                                Text("Email: ${user.email}"),
                                Text("Username: ${user.username}"),
                                Text("Password: ${user.password}"),
                                Text("Role: ${user.role}"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.green),
                                  onPressed: () {
                                    if (_users[index].id != null) {
                                      _UserIdController.text =
                                          _users[index].id ?? "";
                                      _NameController.text =
                                          _users[index].name ?? "";
                                      _EmailIdController.text =
                                          _users[index].email ?? "";
                                      _UserNameController.text =
                                          _users[index].username ?? "";
                                      _PasswordController.text =
                                          _users[index].password ?? "";
                                      _RoleController.text =
                                          _users[index].role ?? "";
                                      showModalBottomSheet(
                                          enableDrag: true,
                                          isDismissible: false,
                                          isScrollControlled: true,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                          ),
                                          backgroundColor: Colors.white,
                                          context: context,
                                          builder: (context) {
                                            return SingleChildScrollView(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20,
                                                    right: 20,
                                                    top: 10,
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom),
                                                child: Form(
                                                  key: _formKey,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      const SizedBox(
                                                        height: 0,
                                                      ),
                                                      InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          labelText:
                                                              "Edit User",
                                                          labelStyle:
                                                              const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 25,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                          prefixIcon:
                                                              const Icon(
                                                            Icons.edit,
                                                            color: Colors.black,
                                                          ),
                                                          suffixIcon:
                                                              IconButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            icon: const Icon(
                                                              Icons
                                                                  .cancel_outlined,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const Divider(
                                                        color: Colors.black,
                                                        thickness: 2,
                                                        indent: 5,
                                                        endIndent: 5,
                                                      ),
                                                      const SizedBox(
                                                        height: 16.0,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _UserIdController,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'user Id ',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please Enter User Id';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 16.0,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _NameController,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Name',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter name';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 16.0,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _EmailIdController,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Email Id',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter your email';
                                                          } else if (GetUtils
                                                              .isEmail(
                                                                  _EmailIdController
                                                                      .text)) {
                                                            return 'Please enter a valid email';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 16.0,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _UserNameController,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'User Name ',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter user name';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 16.0,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _PasswordController,
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          labelText: 'Password',
                                                          suffixIcon:
                                                              IconButton(
                                                            icon: Icon(
                                                              _isPasswordVisible
                                                                  ? Icons
                                                                      .visibility
                                                                  : Icons
                                                                      .visibility_off,
                                                              color: Theme.of(
                                                                      context)
                                                                  .primaryColorDark,
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                _isPasswordVisible =
                                                                    !_isPasswordVisible;
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                        obscureText:
                                                            !_isPasswordVisible,
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter your password';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 16.0,
                                                      ),
                                                      TextFormField(
                                                        controller:
                                                            _RoleController,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText: 'Role ',
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                        ),
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Please enter your Role';
                                                          }
                                                          return null;
                                                        },
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      SizedBox(
                                                        height: 50,
                                                        width: double.infinity,
                                                        child: ElevatedButton(
                                                          onPressed: () {
                                                            submitEditUser();
                                                          },
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            backgroundColor:
                                                                Colors.teal,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                          ),
                                                          child: const Text(
                                                            "SUBMIT",
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 16.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    } else {
                                      // print("Cant Addd");
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                IconButton(
                                  icon: const Icon(
                                      Icons.delete_forever_outlined,
                                      color: Colors.red),
                                  onPressed: () {
                                    if (_users[index].id != null) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Delete User'),
                                              content: const Text(
                                                  'Are you sure you want to delete this user?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Cancel'),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                                AnimatedSwitcher(
                                                  duration: const Duration(
                                                      seconds: 5),
                                                  transitionBuilder:
                                                      (child, animation) {
                                                    return ScaleTransition(
                                                      scale: animation,
                                                      child: child,
                                                    );
                                                  },
                                                  child: TextButton(
                                                    key: ValueKey<String>(
                                                        _users[index].id!),
                                                    child: const Text('Delete'),
                                                    onPressed: () {
                                                      deleteUserById(
                                                              _users[index].id!)
                                                          .then((_) {
                                                        Navigator.of(context)
                                                            .pop();
                                                        setState(() {
                                                          _users
                                                              .removeAt(index);
                                                        });
                                                      }).catchError((error) {});
                                                    },
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      // print('User is null');
                                    }
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text('Home'),
    //     actions: [
    //       IconButton(
    //         icon: const Icon(Icons.add_box_outlined),
    //         onPressed: addNewMeal,
    //       ),
    //     ],
    //   ),
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       Expanded(
    //         child: ListView.builder(
    //           itemCount: fetchedData.length,
    //           itemBuilder: (BuildContext context, int index) {
    //             final category = fetchedData[index];
    //             return ListTile(
    //               leading: CircleAvatar(
    //                 backgroundImage: NetworkImage(category['imageUrl']),
    //               ),
    //               title: Text(category['name']),
    //               onTap: () {
    //                 Get.to(MealDetailScreen(
    //                   category: category,
    //                 ));
    //               },
    //               onLongPress: () {
    //                 showDialog(
    //                   context: context,
    //                   builder: (BuildContext context) {
    //                     return AlertDialog(
    //                       title: const Text('Delete Meal'),
    //                       content: const Text(
    //                           'Are you sure you want to delete this meal?'),
    //                       actions: <Widget>[
    //                         TextButton(
    //                           onPressed: () {
    //                             Navigator.of(context).pop();
    //                           },
    //                           child: const Text('Cancel'),
    //                         ),
    //                         TextButton(
    //                           onPressed: () {
    //                             setState(() {
    //                               fetchedData.removeAt(index);
    //                             });
    //                             Navigator.of(context).pop();
    //                           },
    //                           child: const Text('Delete'),
    //                         ),
    //                       ],
    //                     );
    //                   },
    //                 );
    //               },
    //             );
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: (() => signOut()),
    //     child: const Icon(Icons.logout),
    //   ),
    // );
  }
}
