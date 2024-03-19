import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var name = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();
  var u_name = TextEditingController();
  var mobile = TextEditingController();
  var namevalue = "No Value";
  var emailvalue = "No Value";
  var passvalue = "No Value";
  var u_namevalue = "No Value";
  var contactvalue = "No Value";

  Future<void> getValue() async {
    var prefs = await SharedPreferences.getInstance();
    var prefs2 = await SharedPreferences.getInstance();
    var prefs3 = await SharedPreferences.getInstance();
    var prefs4 = await SharedPreferences.getInstance();
    var prefs5 = await SharedPreferences.getInstance();
    var getname = prefs.getString("name");
    var getemail = prefs2.getString("email");
    var getu_name = prefs3.getString("u_name");
    var getpass = prefs4.getString("password");
    var getcontact = prefs5.getString("Contact");
    namevalue = getname!;
    emailvalue = getemail!;
    u_namevalue = getu_name!;
    passvalue = getpass!;
    contactvalue = getcontact!;
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
                    controller: name,
                    decoration: const InputDecoration(
                        hintText: "Enter Name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: email,
                    decoration: const InputDecoration(
                        hintText: "Enter email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: pass,
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
                    controller: u_name,
                    decoration: const InputDecoration(
                        hintText: "Enter Username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: mobile,
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
                          var Name = name.text.toString();
                          var Email = email.text.toString();
                          var U_name = u_name.text.toString();
                          var Pass = pass.text.toString();
                          var Contact = mobile.text.toString();
                          var prefs = await SharedPreferences.getInstance();
                          var prefs2 = await SharedPreferences.getInstance();
                          var prefs3 = await SharedPreferences.getInstance();
                          var prefs4 = await SharedPreferences.getInstance();
                          var prefs5 = await SharedPreferences.getInstance();
                          prefs.setString("name", Name);
                          prefs2.setString("email", Email);
                          prefs3.setString("u_name", U_name);
                          prefs4.setString("password", Pass);
                          prefs5.setString("Contact", Contact);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Register Successfully")));
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
