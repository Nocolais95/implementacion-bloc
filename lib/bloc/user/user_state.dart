// State: es el estado actualmente de nuestra app, nos dice por ej quien esta logueado, cuantos productos tengo, etc
part of 'user_bloc.dart';

// Se usa clases abstractas para que no se puedan crear instancias de esta clase
// e inmutables para que no pueda cambiar

@immutable
abstract class UserState {

  final bool existUser;
  final Usuario? user;

  const UserState({this.existUser = false, this.user,});
} 


// Este es el estado inicial del bloc
class UserInitialState extends UserState {
  // llamamos al contructor
  const UserInitialState () : super (existUser: false, user: null);
}

class UserSetState extends UserState {
  final Usuario newUser;

  // Tiene que llamar al padre para inicializar los valores respectivamente
  const UserSetState(this.newUser) : super (existUser: true, user: newUser);
}