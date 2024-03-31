import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import '../../utils/route/app_routes.dart';
import 'main_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(hintText: "Enter your email"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Password",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(hintText: "Enter your Password"),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Password';
              }
              return null;
            },
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                "Forget Password ?",
              ),
            ),
          ),
          const SizedBox(height: 30),
          MainButton(
            height: 40,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                
                Navigator.pushNamed(context, AppRoutes.bottomNavbar);
              }
            },
            title: "Login",
          ),
        ],
      ),
    );
  }
}
