part of 'contact_list_bloc.dart';

@freezed
class ContactsListState with _$ContactsListState {
  factory ContactsListState.initial() = _ContactsListStateInitial;
  factory ContactsListState.data({required List<ContactModel> contacts}) =
      _ContactsListStateData;
  factory ContactsListState.error({required String error}) = _ContactListError;
}
