import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/loginbloc_bloc.dart';
import 'bloc/loginbloc_state.dart';
import 'pages/failureview.dart';
import 'pages/initialview.dart';
import 'pages/loadingview.dart';
import 'pages/widgetdatos.dart';


void main() {
  runApp(const Pio());
}

class Pio extends StatelessWidget {
  const Pio({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BlocLoginBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<BlocLoginBloc, BlocLoginState>(
          listener: (context, state) {
            if (state is HomeSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Suceso()),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeLoading) {
              return const LoadingView();
            } else if (state is HomeFailure) {
              return const FailureView();
            } else {
              return const InitialView();
            }
          },
        ),
      ),
    );
  }
}
