import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authenticator_state.dart';

class AuthenticatorCubit extends Cubit<AuthenticatorState> {
  AuthenticatorCubit() : super(AuthenticatorInitial());
}
