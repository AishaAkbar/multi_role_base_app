import 'package:flutter/material.dart';
import 'package:multi_roll_base_app/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TeacherScreen extends StatefulWidget {
  const TeacherScreen({super.key});

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  String email = '', age = '', name = '', type = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  loaddata() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    age = sp.getString('age') ?? '';
    name = sp.getString('name') ?? '';
    type = sp.getString('usertype') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Teacher Screen'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('email'), Text(email.toString())],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('age'), Text(age.toString())],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('name'), Text(name.toString())],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('User Type'), Text(type.toString())],
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadiusDirectional.all(Radius.circular(30)),
              ),
              child: Center(
                  child: Text(
                'Log Out',
              )),
            ),
          ),
        ],
      ),
    );
  }
}
