import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:people_rating_app/domain/core/i_network_info.dart';

class NetworkInfo implements INetworkInfo {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfo(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
}