import 'package:flutter/material.dart';
import 'package:flutter_app_1/bloc/user/user_bloc.dart';
import 'package:flutter_app_1/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina2Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer Usuario', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                final newUser = Usuario(
                  nombre: 'Maxi', 
                  edad: 26, 
                  profesiones: ['Developer', 'Estudiante']);
                // Para disparar un evento, se añade un evento
                
                userBloc.add(ActivateUser(newUser));
              },
              ),
            MaterialButton(
              child: Text('Cambiar Edad', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){

                userBloc.add(ChangeUserAge(78));
              },
              ),
            MaterialButton(
              child: Text('Añadir Profesion', style: TextStyle(color: Colors.white),),
              color: Colors.blue,
              onPressed: (){
                userBloc.add(AddProfession('Ingeniero'));
              },
              ),
          ],),
     ),
   );
  }
}