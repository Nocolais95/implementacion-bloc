import 'package:flutter/material.dart';
import 'package:flutter_app_1/bloc/user/user_bloc.dart';
import 'package:flutter_app_1/pages/pagina1_page.dart';
import 'package:flutter_app_1/pages/pagina2_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((_) => UserBloc() ))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: "Pagina1",
        routes: {
          'Pagina1' :(_) => Pagina1Page(), 
          'Pagina2' :(_) => Pagina2Page(), 
        },
      ),
    );
  }
}