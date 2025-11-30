import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/car_bloc_bloc.dart';
import 'widgets/failureview.dart';
import 'widgets/loadingview.dart';
import 'widgets/succesview.dart';

class Datos extends StatelessWidget {
  const Datos({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CarBlocBloc()..add(Cargardata()),
      child: BlocConsumer<CarBlocBloc, CarBlocState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LoadLoading) {
            return const LoadingView();
          } else if (state is LoadSuccess) {
            return Succes(data: state.data);
          } else if (state is LoadFailure) {
            return const FailureView();
          } else {
            return const LoadingView();
          }
        },
      ),
    );
  }
}
