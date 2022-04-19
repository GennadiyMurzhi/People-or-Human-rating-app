import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_remote_data_sorce.dart';
import 'package:people_rating_app/domain/core/failures.dart';

@Injectable(as: IContactsRemoteDataSource)
class ContactsRemoteDataSource implements IContactsRemoteDataSource {
  final Dio _dio;

  ContactsRemoteDataSource(this._dio);

  @override
  Future<Contacts> getContactsOfRegisteredUsers(Contacts contactsFromPhone) async {
    final response = await _dio.post('/api/contacts', data: contactsFromPhone.toJson().toString());

    if(response.statusCode == 200) {
      return Contacts.fromJson(response.data);
    } else {
      throw ServerError(statusCode: response.statusCode!);
    }
  }

}