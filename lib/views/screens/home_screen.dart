import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/theme_cubit.dart';
import '../../cubit/theme_cubit/theme_state.dart';
import '../widgets/custom_drawer.dart';
import 'another_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnotherScreen()),
              );
            },
          ),
        ],
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
                  'Home Screen Content',
                  style: TextStyle(
                    color: state.isTheme ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
      drawer: const CustomDrawer(),
    );
  }
}
