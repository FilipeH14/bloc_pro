import 'package:bloc_pro/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactRepository {

  final usersPath = 'http://192.168.1.8:8080/users';

  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get(usersPath);

    return response.data
        ?.map<ContactModel>((contact) => ContactModel.fromMap(contact))
        .toList();
  }

  Future<void> create(ContactModel model) =>
      Dio().post(usersPath, data: model.toMap());

  Future<void> update(ContactModel model) =>
      Dio().put('$usersPath/${model.id}', data: model.toMap());

  Future<void> delete(ContactModel model) =>
      Dio().delete('$usersPath/${model.id}');
}
