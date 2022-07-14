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

class ChangeUserAge extends UserEvent {

  final int age;

  ChangeUserAge(this.age);
}

class AddProfession extends UserEvent {

  final String profesiones;

  AddProfession(this.profesiones);
}

class DeleteUser extends UserEvent {

  
}