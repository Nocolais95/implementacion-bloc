//User Bloc:  Tiene la informacion actual y procesa los eventos, es teorico
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/models/usuario.dart';


// Esto nos permite ahorrar varias importaciones 
//y trabajar con el archivo como uno solo
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super (const UserInitialState()){
    // con esto manejamos los eventos, 
    //el emit es una funcion que llamo cuando quiero cambiar el estado
    on<ActivateUser> ((event, emit) => emit(UserSetState(event.user)));
    // Simplemente reinicia al estado inicial
    on<DeleteUser> ((event, emit) => emit(const UserInitialState()));

    on<ChangeUserAge>((event, emit) {
      if ( !state.existUser ) return;
      // Aca no mutamos el estado sino que creamos una copia del estado
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfession>((event, emit) {
      if(!state.existUser) return;
      // Con esto añadimos la ultima profesion creada 
      final prof = [...state.user!.profesiones, event.profesiones];
      // y luego hacemos una copia
      emit(UserSetState(state.user!.copyWith(profesiones: prof)));
    });
  }


  
}