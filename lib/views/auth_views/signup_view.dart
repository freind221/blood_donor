// ignore_for_file: use_build_context_synchronously

import 'package:blood_donor/providers/dropdown_provider.dart';
import 'package:blood_donor/resources/firebase_methods.dart';
import 'package:blood_donor/utilis/widgets/custom_button.dart';
import 'package:blood_donor/utilis/widgets/custom_field.dart';
import 'package:blood_donor/utilis/widgets/dropdown.dart';
import 'package:blood_donor/views/homes/acceptor_home.dart';
import 'package:blood_donor/views/homes/admin_home.dart';
import 'package:blood_donor/views/homes/donor_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static String routeName = '/signup';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _userController = TextEditingController();

  bool isloading = false;

  final formKey = GlobalKey<FormState>();

  final AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final dropDown = Provider.of<DropDownProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.1),
                  const Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      controller: _emailController,
                      message: 'Email',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      controller: _userController,
                      message: 'Username',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomTextField(
                      controller: _passwordController,
                      message: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomDropDown(
                      items: ['Donor', 'Acceptor', 'Admin'],
                      title: 'Select your role',
                      check: 'Role',
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      loading: isloading,
                      onTap: () async {
                        print(dropDown.role);
                        setState(() {
                          isloading = true;
                        });

                        if (formKey.currentState!.validate()) {
                          bool res = await authMethods.signupUser(
                              _emailController.text,
                              _passwordController.text,
                              _userController.text,
                              dropDown.role,
                              context);

                          if (res) {
                            if (dropDown.role == 'Acceptor') {
                              Navigator.pushNamed(
                                  context, AcceptorHome.routeName);
                            } else if (dropDown.role == 'Donor') {
                              Navigator.pushNamed(context, DonorHome.routeName);
                            } else if (dropDown.role == 'Admin') {
                              Navigator.pushNamed(context, AdminHome.routeName);
                            }
                            setState(() {
                              isloading = false;
                            });
                          } else {
                            setState(() {
                              isloading = false;
                            });
                          }
                        } else {
                          setState(() {
                            isloading = false;
                          });
                        }
                      },
                      text: 'Sign up'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
