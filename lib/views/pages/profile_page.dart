import 'package:ecommerce_appQ/utils/route/app_routes.dart';
import 'package:ecommerce_appQ/view_models/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/main_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authCubit = BlocProvider.of<AuthCubit>(context);
    return Center(
        child: BlocConsumer<AuthCubit, AuthState>(
      bloc: authCubit,
      listenWhen: (previous, current) =>
          current is AuthFailure || current is AuthInitial,
      buildWhen: (previous, current) =>
          current is AuthLoading || current is AuthFailure,
      builder: (context, state) {
        if (state is AuthLoading) {
          return const MainButton(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        return MainButton(
          title: "Logout",
          onPressed: () async {
            await authCubit.signOut();
          },
        );
      },
      listener: (context, state) {
        if (state is AuthFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ));
        } else if (state is AuthInitial) {
          Navigator.of(context ,rootNavigator: true)
              .pushReplacementNamed(AppRoutes.homeLogin);
        }
      },
    ));
  }
}
