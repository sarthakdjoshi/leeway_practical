import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var userNameController = TextEditingController();
  var mobileController = TextEditingController();
  var nameValue = "No Value";
  var emailValue = "No Value";
  var passValue = "No Value";
  var userNameValue = "No Value";
  var contactValue = "No Value";

  Future<void> getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var prefs2 = await SharedPreferences.getInstance();
    var prefs3 = await SharedPreferences.getInstance();
    var prefs4 = await SharedPreferences.getInstance();
    var prefs5 = await SharedPreferences.getInstance();
    var getName = prefs.getString("name");
    var getEmail = prefs2.getString("email");
    var getUserName = prefs3.getString("u_name");
    var getPass = prefs4.getString("password");
    var getContact = prefs5.getString("Contact");
    nameValue = getName!;
    emailValue = getEmail!;
    userNameValue = getUserName!;
    passValue = getPass!;
    contactValue = getContact!;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getValue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Signup",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        hintText: "Enter email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: passController,
                    obscureText: true,
                    obscuringCharacter: "*",
                    decoration: const InputDecoration(
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller:userNameController,
                    decoration: const InputDecoration(
                        hintText: "Enter Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: mobileController,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        hintText: "Enter Contact No.",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          var name = nameController.text.toString();
                          var email = emailController.text.toString();
                          var username = userNameController.text.toString();
                          var pass = passController.text.toString();
                          var contact = mobileController.text.toString();
                          var prefs = await SharedPreferences.getInstance();
                          var prefs2 = await SharedPreferences.getInstance();
                          var prefs3 = await SharedPreferences.getInstance();
                          var prefs4 = await SharedPreferences.getInstance();
                          var prefs5 = await SharedPreferences.getInstance();
                          prefs.setString("name", name);
                          prefs2.setString("email", email);
                          prefs3.setString("u_name", username);
                          prefs4.setString("password", pass);
                          prefs5.setString("Contact", contact);
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Register Successfully")));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            backgroundColor: Colors.indigo),
                        child: const Text(
                          "Register",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ]),
          ),
        ),
      ),
    );
  }
}
