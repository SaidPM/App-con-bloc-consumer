import 'package:consubloc/bloc/carlbloc_bloc.dart';
import 'package:consubloc/bloc/loginbloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/carscreen.dart';
import 'pages/failureview.dart';
import 'pages/loadingview.dart';
import 'pages/loginscreen.dart';


void main() {
  runApp(const Pio());
}

class Pio extends StatelessWidget {
  const Pio({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginblocBloc()),
        BlocProvider(create: (_) => CarlblocBloc()),
      ],
      child: MaterialApp(
        title: 'Car App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.blue[50],
        ),
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<LoginblocBloc, LoginblocState>(
          listener: (context, state) {
            if (state is LoginblocSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const CarScreen()),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginblocLoading) {
              return const AuthLoadingView();
            } else if (state is LoginblocFailure) {
              return AuthFailureView(
                error: state.error,
                // Callback para reintentar desde AuthFailureView
              );
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}
