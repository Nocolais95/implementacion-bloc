// Event: son acciones que podemos disparar y las va a recibir el bloc y el state
// El objetivo del user event es decirle al bloc que eventos va a poder esperar


part of 'user_bloc.dart';

@immutable
abstract class UserEvent {


}

class ActivateUser extends UserEvent {
  final Usuario user;
  ActivateUser(this.user);
}