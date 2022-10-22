// ignore_for_file: use_build_context_synchronously

import 'package:blood_donor/providers/user_provider.dart';
import 'package:blood_donor/resources/firebase_methods.dart';
import 'package:blood_donor/utilis/widgets/custom_button.dart';
import 'package:blood_donor/utilis/widgets/custom_field.dart';
import 'package:blood_donor/views/homes/acceptor_home.dart';
import 'package:blood_donor/views/homes/admin_home.dart';
import 'package:blood_donor/views/homes/donor_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool isloading = false;

  final formKey = GlobalKey<FormState>();

  final AuthMethods authMethods = AuthMethods();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<UserProvider>(context);
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
                  CustomButton(
                      loading: isloading,
                      onTap: () async {
                        setState(() {
                          isloading = true;
                        });
                        if (formKey.currentState!.validate()) {
                          bool res = await authMethods.loginUser(
                              _emailController.text,
                              _passwordController.text,
                              context);

                          if (res) {
                            setState(() {
                              isloading = false;
                            });
                          }
                          if (user.user.role == 'Acceptor') {
                            Navigator.pushNamed(
                                context, AcceptorHome.routeName);
                          } else if (user.user.role == 'Donor') {
                            Navigator.pushNamed(context, DonorHome.routeName);
                          } else if (user.user.role == 'Admin') {
                            Navigator.pushNamed(context, AdminHome.routeName);
                          }
                        }
                      },
                      text: 'Login'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
