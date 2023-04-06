import 'package:bloc_pro/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactRepository {
  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get('http://10.0.2.2:3031/users');

    return response.data
        ?.map<ContactModel>((contact) => ContactModel.fromMap(contact))
        .toList();
  }

  Future<void> create(ContactModel model) =>
      Dio().post('http://10.0.2.2:3031/users', data: model.toMap());

  Future<void> update(ContactModel model) =>
      Dio().put('http://10.0.2.2:3031/users/${model.id}', data: model.toMap());

  Future<void> delete(ContactModel model) =>
      Dio().delete('http://10.0.2.2:3031/users/${model.id}');
}
