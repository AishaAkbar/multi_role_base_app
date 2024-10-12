import 'package:flutter/material.dart';
import 'package:multi_roll_base_app/home_screen.dart';
import 'package:multi_roll_base_app/student_screen.dart';
import 'package:multi_roll_base_app/teacher_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Sign Up Page'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your Email',
                  )),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter your Name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: ageController,
                decoration: InputDecoration(
                  hintText: 'Enter your age',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('name', nameController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setBool('islogin', true);
                  sp.setString('usertype', 'Teacher');
                  if (sp.getString('usertype') == 'teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => TeacherScreen())));
                  } else if (sp.getString('usertype') == 'student') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StudentScreen()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                },
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(30)),
                  ),
                  child: Center(
                      child: Text(
                    'SignUp',
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}
