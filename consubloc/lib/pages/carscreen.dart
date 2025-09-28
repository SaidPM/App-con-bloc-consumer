import 'package:consubloc/bloc/carlbloc_bloc.dart';
import 'package:consubloc/pages/carsuccess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'carfailure.dart';
import 'carloading.dart';



class CarScreen extends StatelessWidget {
  const CarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CarlblocBloc>().add(Carconse());

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Información del Vehículo'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<CarlblocBloc, CarlblocState>(
        listener: (context, state) {
          if (state is CarlblocSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Datos cargados correctamente'),
                  ],
                ),
                backgroundColor: Colors.green[600],
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }
        },
        child: BlocBuilder<CarlblocBloc, CarlblocState>(
          builder: (context, state) {
            if (state is CarlblocInitial) {
              return CarLoadingView();
            } else if(state is CarlblocLoading){
              return CarLoadingView();
            }
             else if (state is CarlbloFailure) {
              return CarFailureView(error: state.error);
            } else if (state is CarlblocSuccess) {
              return CarSuccessView(carData: state.carData);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}