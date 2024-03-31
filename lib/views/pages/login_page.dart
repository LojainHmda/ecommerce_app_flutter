import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: size.height * .1),
            Text("Login Account",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 8),
            Text("Provide login with regiseterd account",
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: AppColors.grey)),
            const SizedBox(height: 16),
            const LoginForm(),
            const SizedBox(height: 40),
            Center(
              child: Text("or, using other method",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: AppColors.grey)),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.facebook),
                  label: const Text("Sign in using Facebook")),
            )
          ]),
        ),
      ),
    );
  }
}
