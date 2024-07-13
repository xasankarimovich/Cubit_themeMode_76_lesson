import 'package:bloc_cubit/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/theme_cubit.dart';
import '../../cubit/theme_cubit/theme_state.dart';

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Screen'),
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (BuildContext context, ThemeState state) {
          return SafeArea(
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: state.isTheme ? Colors.black : Colors.white,
              child: Center(
                child: Text(
                  'This is another screen',
                  style: TextStyle(color: state.isTheme ? Colors.white : Colors.black),
                ),
              ),
            ),
          );
        },
      ),
      drawer: CustomDrawer(),
    );
  }
}
