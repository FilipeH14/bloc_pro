import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_pro/models/contact_model.dart';
import 'package:bloc_pro/repositories/contact_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_list_event.dart';
part 'contacts_list_state.dart';
part 'contact_list_bloc.freezed.dart';

class ContactListBloc extends Bloc<ContactsListEvent, ContactsListState> {
  final ContactRepository _repository;

  ContactListBloc({required ContactRepository repository})
      : _repository = repository,
        super(ContactsListState.initial()) {
    on<_ContactListEventFindAll>(_findAll);
  }

  Future<void> _findAll(
      _ContactListEventFindAll event, Emitter<ContactsListState> emit) async {
    try {
      final contacts = await _repository.findAll();
      emit(ContactsListState.data(contacts: contacts));
    } catch (e, s) {
      log('Erro ao buscar contato', error: e, stackTrace: s);
      emit(ContactsListState.error(error: 'Erro ao bucar contatos'));
    }
  }
}
