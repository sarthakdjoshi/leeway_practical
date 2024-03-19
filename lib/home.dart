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
        child: Card(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Login Name = $namevalue",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                SizedBox(height: 8,),
                Text("Login email = $emailvalue",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
              ],
            ),
          ),
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