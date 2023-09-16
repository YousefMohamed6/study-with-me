import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studytome/features/home/data/cubit/home_cubit.dart';
import 'package:studytome/features/home/presentation/views/widgets/floating_action_button.dart';
import 'package:studytome/features/home/presentation/views/widgets/navigation_view_body.dart';
import 'package:studytome/features/home/presentation/views/widgets/navigationbar.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({super.key, required this.state});
  final HomeState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          state is ContactUs ? null : CustomFloatingActionButton(state: state),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: BlocProvider.of<HomeCubit>(context).currentIndex,
      ),
      body: const NavigationViewBody(),
    );
  }
}
