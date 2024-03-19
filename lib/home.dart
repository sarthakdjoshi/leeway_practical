import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var namevalue="No Value";
  var emailvalue="No Value";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getval();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home",style: TextStyle(color: Colors.white),),
        centerTitle: true,

      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Login Name=$namevalue",style: TextStyle(fontSize: 20),),
            Text("Login email=$emailvalue",style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }

  void getval() async{
    var prefs=await SharedPreferences.getInstance();
    var prefs2=await SharedPreferences.getInstance();

    var getname= prefs.getString("name");
    var getemail=  prefs2.getString("email");

    namevalue=getname!;
    emailvalue=getemail!;
    setState(() {

    });
  }
}