import 'package:ecommerce_appQ/utils/app_colors.dart';
import 'package:ecommerce_appQ/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/route/app_routes.dart';
import 'main_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isVisible = false;
  bool isLogin = true;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      await BlocProvider.of<AuthCubit>(context).signInWithEmailAndPassword(
          _emailController.text, _passwordController.text);
    }
  }

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      String email = _emailController.text;
      String password = _passwordController.text;
      try {
        await BlocProvider.of<AuthCubit>(context)
            .signUpWithEmailAndPassword(email, password);
      } catch (e) {
        print('Failed to register: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AuthCubit>(context);

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
              } else if (!RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
                return 'Please enter a valid email address';
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
            decoration: InputDecoration(
                hintText: "Enter your Password",
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: Icon(
                      _isVisible
                          ? Icons.visibility_off_outlined
                          : Icons.visibility,
                      color: AppColors.grey,
                    ))),
            obscureText: _isVisible,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your Password';
              } else if (value.length < 6) {
                return ' Password must be at least 6 characters';
              }
              return null;
            },
          ),
          if (isLogin)
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "Forget Password ?",
                ),
              ),
            ),
          const SizedBox(height: 36),
          BlocConsumer<AuthCubit, AuthState>(
            bloc: cubit,
            listenWhen: (previous, current) =>
                current is AuthSuccess || current is AuthFailure,
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamed(context, AppRoutes.bottomNavbar);
              } else if (state is AuthFailure) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Error"),
                      content: Text(state.message),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("OK"),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            buildWhen: (previous, current) =>
                current is AuthLoading ||
                current is AuthFailure ||
                current is AuthInitial ||
                current is AuthSuccess,
            builder: (context, state) {
              if (state is AuthLoading) {
                return const MainButton(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
              return MainButton(
                onPressed: isLogin ? login : register,
                title: isLogin ? "Login" : "Register",
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
          TextButton(
              onPressed: () => setState(() {
                    isLogin = !isLogin;
                  }),
              child: Align(
                  child: Text(isLogin
                      ? "Register NOW!!"
                      : "Already have account? Login")))
        ],
      ),
    );
  }
}
