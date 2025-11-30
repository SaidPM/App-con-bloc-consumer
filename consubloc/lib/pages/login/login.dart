import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../datos/widgets/widgetdatos.dart';
import 'cubit/cubitlogin_cubit.dart';
import 'widgets/initialview.dart';
import 'widgets/loadingfailure.dart';
import 'widgets/loginloading.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CubitloginCubit(),
      child: BlocConsumer<CubitloginCubit, CubitloginState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CubitloginLoading) {
            return const LoginLoadingView();
          } else if (state is CubitloginFailure) {
            return const LoginFailureView();
          } else if (state is CubitloginSuccess) {
            return const Suceso();
          } else {
            return InitialView();
          }
        },
      ),
    );
  }
}
