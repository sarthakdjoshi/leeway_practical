import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:leeway_practical/home.dart';
import 'package:leeway_practical/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var email = TextEditingController();
  var pass = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          String storedEmail = prefs.getString('email') ?? '';
                          String storedPass = prefs.getString('password') ?? '';
                          String enteredEmail = email.text;
                          String enteredPass = pass.text;

                          if (enteredEmail == storedEmail && enteredPass == storedPass) {
                            Navigator.push(context, MaterialPageRoute(builder:  (context) =>Home(),));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed")));
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero),
                            backgroundColor: Colors.indigo),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don't Have Account?",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CupertinoButton(
                          child: const Text(
                            "Create An Account",
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Signup(),

                                ));

                          })
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
