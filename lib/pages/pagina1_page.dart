import 'package:flutter/material.dart';
import 'package:flutter_app_1/bloc/user/user_bloc.dart';
import 'package:flutter_app_1/models/usuario.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: (){
              BlocProvider.of<UserBloc>(context, listen: false)
              .add(DeleteUser());
            }, 
            )
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {

          return state.existUser
          ? InformacionUsuario(user: state.user!)
          : const Center(
            child: Text('No hay usuario seleccionado'),
          );
        },
      ),
      
      //InformacionUsuario(),
     floatingActionButton: FloatingActionButton(
      child: Icon(Icons.accessibility_new),
      onPressed: () {
        Navigator.pushNamed(context, 'Pagina2');
      }),
   );
  }
}

class InformacionUsuario extends StatelessWidget {

  final Usuario user;

  const InformacionUsuario({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('General', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          ListTile( title: Text('Nombre : ${user.nombre}'),),
          ListTile( title: Text('Edad: ${user.edad}'),),

          Text('Profesiones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          Divider(),
          // En vez de hacer esto, hacemos un map
          /*
          ListTile( title: Text('Profesion 1 : ${user.profesiones[0]}'),),
          ListTile( title: Text('Profesion 2 :'),),
          ListTile( title: Text('Profesion 3 :'),),
          */
          ...user.profesiones.map(
            (prof) => ListTile( title: Text(prof))
            ).toList()
          
        ],
      ),
    );
  }
}