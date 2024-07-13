import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/theme_cubit.dart';
import '../../cubit/theme_cubit/theme_state.dart';
import '../screens/home_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (BuildContext context, ThemeState state) {
              return DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(state.isTheme ? 'assets/moon.png' : 'assets/sun.png'),
                    fit: BoxFit.cover,
                  ),
                ), child: null,

              );
            },
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (BuildContext context, ThemeState state) {
              return SwitchListTile(
                title: Text(state.isTheme ? 'Dark Theme' : 'Light Theme'),
                value: state.isTheme,
                onChanged: (bool value) {
                  context.read<ThemeCubit>().CheckTheme(value);
                },
              );
            },
          ),
          ListTile(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx){
                return HomeScreen();
              },),);
            },
            leading: Icon(Icons.home),
            title: Text('HomeScreen'),
            trailing: Icon(Icons.keyboard_arrow_right,size: 30,),

          ),
        ],
      ),
    );
  }
}
