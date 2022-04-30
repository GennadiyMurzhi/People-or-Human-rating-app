import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_remote_data_sorce.dart';
import 'package:people_rating_app/domain/core/errors.dart';
import 'package:people_rating_app/domain/core/i_network_info.dart';

@Injectable(as: IContactsRemoteDataSource)
class ContactsRemoteDataSource implements IContactsRemoteDataSource {
  final Dio _dio;
  final INetworkInfo _networkInfo;

  ContactsRemoteDataSource(this._dio, this._networkInfo);

  @override
  Future<UpdatedContacts> updateContactsOnServer(PhoneContacts contactsFromPhone) async {
    if (await _networkInfo.isConnected) {
      final Response response;

      try {
        response = await _dio.post('/api/contacts', data: contactsFromPhone.toJson().toString());
      } on DioError {
        throw ServerError(statusCode: 8);
      }

      if (response.statusCode == 200) {
        return UpdatedContacts.fromJson(response.data);
      } else {
        throw ServerError(statusCode: response.statusCode!);
      }
    } else {
      throw NoInternetConnectionError();
    }
  }
}
