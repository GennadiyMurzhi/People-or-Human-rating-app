import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/core/errors.dart';
import 'package:people_rating_app/domain/core/i_network_info.dart';
import 'package:people_rating_app/domain/profile/i_profile_remote_data_source.dart';
import 'package:people_rating_app/domain/profile/profile.dart';

@Injectable(as: IProfileRemoteDataSource)
class ProfileRemoteDataSource extends IProfileRemoteDataSource {
  final INetworkInfo _networkInfo;
  final Dio _dio;

  ProfileRemoteDataSource(this._networkInfo, this._dio);

  @override
  Future<Profile> getProfileInfoFromServer(String phoneNumberId) async {
    if (await _networkInfo.isConnected) {
      final Response response;

      try {
        response = await _dio.post('/api/profile', data: phoneNumberId);
      } on DioError {
        throw ServerError(statusCode: 8);
      }

      if (response.statusCode == 200) {
        return Profile.fromJson(response.data);
      } else {
        throw ServerError(statusCode: response.statusCode!);
      }
    } else {
      throw NoInternetConnectionError();
    }
  }
}
