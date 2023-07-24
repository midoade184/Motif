import 'package:flutter/material.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _url = await secureStorage.getString('ff_url') ?? _url;
    });
    await _safeInitAsync(() async {
      _authToken = await secureStorage.getString('ff_authToken') ?? _authToken;
    });
    await _safeInitAsync(() async {
      _tokeUrl = await secureStorage.getString('ff_tokeUrl') ?? _tokeUrl;
    });
    await _safeInitAsync(() async {
      _userEmail = await secureStorage.getString('ff_userEmail') ?? _userEmail;
    });
    await _safeInitAsync(() async {
      _userPassword =
          await secureStorage.getString('ff_userPassword') ?? _userPassword;
    });
    await _safeInitAsync(() async {
      _isLoggedIn = await secureStorage.getBool('ff_isLoggedIn') ?? _isLoggedIn;
    });
    await _safeInitAsync(() async {
      _userId = await secureStorage.getString('ff_userId') ?? _userId;
    });
    await _safeInitAsync(() async {
      _userToken = await secureStorage.getString('ff_userToken') ?? _userToken;
    });
    await _safeInitAsync(() async {
      _firstName = await secureStorage.getString('ff_firstName') ?? _firstName;
    });
    await _safeInitAsync(() async {
      _lastName = await secureStorage.getString('ff_lastName') ?? _lastName;
    });
    await _safeInitAsync(() async {
      _userName = await secureStorage.getString('ff_userName') ?? _userName;
    });
    await _safeInitAsync(() async {
      _company = await secureStorage.getString('ff_company') ?? _company;
    });
    await _safeInitAsync(() async {
      _streetName =
          await secureStorage.getString('ff_streetName') ?? _streetName;
    });
    await _safeInitAsync(() async {
      _buildingNo =
          await secureStorage.getString('ff_buildingNo') ?? _buildingNo;
    });
    await _safeInitAsync(() async {
      _appartmentNo =
          await secureStorage.getString('ff_appartmentNo') ?? _appartmentNo;
    });
    await _safeInitAsync(() async {
      _city = await secureStorage.getString('ff_city') ?? _city;
    });
    await _safeInitAsync(() async {
      _country = await secureStorage.getString('ff_country') ?? _country;
    });
    await _safeInitAsync(() async {
      _phone = await secureStorage.getString('ff_phone') ?? _phone;
    });
    await _safeInitAsync(() async {
      _floorNo = await secureStorage.getString('ff_floorNo') ?? _floorNo;
    });
    await _safeInitAsync(() async {
      _avatarUrl = await secureStorage.getString('ff_avatarUrl') ?? _avatarUrl;
    });
    await _safeInitAsync(() async {
      _currency = await secureStorage.getString('ff_currency') ?? _currency;
    });
    await _safeInitAsync(() async {
      _logo = await secureStorage.getString('ff_logo') ?? _logo;
    });
    await _safeInitAsync(() async {
      _searchHistory = await secureStorage.getStringList('ff_searchHistory') ??
          _searchHistory;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  String _url = 'https://motifeg.com/wp-json/wc/v3';
  String get url => _url;
  set url(String _value) {
    _url = _value;
    secureStorage.setString('ff_url', _value);
  }

  void deleteUrl() {
    secureStorage.delete(key: 'ff_url');
  }

  String _authToken =
      'Y2tfNDJlOGEwNzQ4ZmMxYzg4NzBjYzQyNjE4ZDk3MTg3ZDZlZjc3MzZmNjpjc19kOWYwOTcxNmVjY2M0MDEyNTFkM2RkZWJkZmUwNzRlZjg1MTMxMGI3';
  String get authToken => _authToken;
  set authToken(String _value) {
    _authToken = _value;
    secureStorage.setString('ff_authToken', _value);
  }

  void deleteAuthToken() {
    secureStorage.delete(key: 'ff_authToken');
  }

  String _tokeUrl = 'https://motifeg.com/wp-json/jwt-auth/v1/token';
  String get tokeUrl => _tokeUrl;
  set tokeUrl(String _value) {
    _tokeUrl = _value;
    secureStorage.setString('ff_tokeUrl', _value);
  }

  void deleteTokeUrl() {
    secureStorage.delete(key: 'ff_tokeUrl');
  }

  String _userEmail = '';
  String get userEmail => _userEmail;
  set userEmail(String _value) {
    _userEmail = _value;
    secureStorage.setString('ff_userEmail', _value);
  }

  void deleteUserEmail() {
    secureStorage.delete(key: 'ff_userEmail');
  }

  String _userPassword = '';
  String get userPassword => _userPassword;
  set userPassword(String _value) {
    _userPassword = _value;
    secureStorage.setString('ff_userPassword', _value);
  }

  void deleteUserPassword() {
    secureStorage.delete(key: 'ff_userPassword');
  }

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  set isLoggedIn(bool _value) {
    _isLoggedIn = _value;
    secureStorage.setBool('ff_isLoggedIn', _value);
  }

  void deleteIsLoggedIn() {
    secureStorage.delete(key: 'ff_isLoggedIn');
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String _value) {
    _userId = _value;
    secureStorage.setString('ff_userId', _value);
  }

  void deleteUserId() {
    secureStorage.delete(key: 'ff_userId');
  }

  String _userToken = '';
  String get userToken => _userToken;
  set userToken(String _value) {
    _userToken = _value;
    secureStorage.setString('ff_userToken', _value);
  }

  void deleteUserToken() {
    secureStorage.delete(key: 'ff_userToken');
  }

  String _firstName = '';
  String get firstName => _firstName;
  set firstName(String _value) {
    _firstName = _value;
    secureStorage.setString('ff_firstName', _value);
  }

  void deleteFirstName() {
    secureStorage.delete(key: 'ff_firstName');
  }

  String _lastName = '';
  String get lastName => _lastName;
  set lastName(String _value) {
    _lastName = _value;
    secureStorage.setString('ff_lastName', _value);
  }

  void deleteLastName() {
    secureStorage.delete(key: 'ff_lastName');
  }

  String _userName = '';
  String get userName => _userName;
  set userName(String _value) {
    _userName = _value;
    secureStorage.setString('ff_userName', _value);
  }

  void deleteUserName() {
    secureStorage.delete(key: 'ff_userName');
  }

  String _company = '';
  String get company => _company;
  set company(String _value) {
    _company = _value;
    secureStorage.setString('ff_company', _value);
  }

  void deleteCompany() {
    secureStorage.delete(key: 'ff_company');
  }

  String _streetName = '';
  String get streetName => _streetName;
  set streetName(String _value) {
    _streetName = _value;
    secureStorage.setString('ff_streetName', _value);
  }

  void deleteStreetName() {
    secureStorage.delete(key: 'ff_streetName');
  }

  String _buildingNo = '';
  String get buildingNo => _buildingNo;
  set buildingNo(String _value) {
    _buildingNo = _value;
    secureStorage.setString('ff_buildingNo', _value);
  }

  void deleteBuildingNo() {
    secureStorage.delete(key: 'ff_buildingNo');
  }

  String _appartmentNo = '';
  String get appartmentNo => _appartmentNo;
  set appartmentNo(String _value) {
    _appartmentNo = _value;
    secureStorage.setString('ff_appartmentNo', _value);
  }

  void deleteAppartmentNo() {
    secureStorage.delete(key: 'ff_appartmentNo');
  }

  String _city = '';
  String get city => _city;
  set city(String _value) {
    _city = _value;
    secureStorage.setString('ff_city', _value);
  }

  void deleteCity() {
    secureStorage.delete(key: 'ff_city');
  }

  String _country = '';
  String get country => _country;
  set country(String _value) {
    _country = _value;
    secureStorage.setString('ff_country', _value);
  }

  void deleteCountry() {
    secureStorage.delete(key: 'ff_country');
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String _value) {
    _phone = _value;
    secureStorage.setString('ff_phone', _value);
  }

  void deletePhone() {
    secureStorage.delete(key: 'ff_phone');
  }

  String _floorNo = '';
  String get floorNo => _floorNo;
  set floorNo(String _value) {
    _floorNo = _value;
    secureStorage.setString('ff_floorNo', _value);
  }

  void deleteFloorNo() {
    secureStorage.delete(key: 'ff_floorNo');
  }

  int _shopCurrentPage = 1;
  int get shopCurrentPage => _shopCurrentPage;
  set shopCurrentPage(int _value) {
    _shopCurrentPage = _value;
  }

  int _shopTotalPages = 0;
  int get shopTotalPages => _shopTotalPages;
  set shopTotalPages(int _value) {
    _shopTotalPages = _value;
  }

  String _avatarUrl = '';
  String get avatarUrl => _avatarUrl;
  set avatarUrl(String _value) {
    _avatarUrl = _value;
    secureStorage.setString('ff_avatarUrl', _value);
  }

  void deleteAvatarUrl() {
    secureStorage.delete(key: 'ff_avatarUrl');
  }

  List<dynamic> _checkoutCartProducts = [];
  List<dynamic> get checkoutCartProducts => _checkoutCartProducts;
  set checkoutCartProducts(List<dynamic> _value) {
    _checkoutCartProducts = _value;
  }

  void addToCheckoutCartProducts(dynamic _value) {
    _checkoutCartProducts.add(_value);
  }

  void removeFromCheckoutCartProducts(dynamic _value) {
    _checkoutCartProducts.remove(_value);
  }

  void removeAtIndexFromCheckoutCartProducts(int _index) {
    _checkoutCartProducts.removeAt(_index);
  }

  void updateCheckoutCartProductsAtIndex(
    int _index,
    dynamic Function(dynamic) updateFn,
  ) {
    _checkoutCartProducts[_index] = updateFn(_checkoutCartProducts[_index]);
  }

  dynamic _checkoutBilling;
  dynamic get checkoutBilling => _checkoutBilling;
  set checkoutBilling(dynamic _value) {
    _checkoutBilling = _value;
  }

  int _cartKey = 0;
  int get cartKey => _cartKey;
  set cartKey(int _value) {
    _cartKey = _value;
  }

  String _currency = 'EGP';
  String get currency => _currency;
  set currency(String _value) {
    _currency = _value;
    secureStorage.setString('ff_currency', _value);
  }

  void deleteCurrency() {
    secureStorage.delete(key: 'ff_currency');
  }

  String _logo =
      'https://motifeg.com/wp-content/uploads/2023/03/motif-site-icon.png';
  String get logo => _logo;
  set logo(String _value) {
    _logo = _value;
    secureStorage.setString('ff_logo', _value);
  }

  void deleteLogo() {
    secureStorage.delete(key: 'ff_logo');
  }

  int _cartQuantity = 0;
  int get cartQuantity => _cartQuantity;
  set cartQuantity(int _value) {
    _cartQuantity = _value;
  }

  List<String> _searchHistory = [];
  List<String> get searchHistory => _searchHistory;
  set searchHistory(List<String> _value) {
    _searchHistory = _value;
    secureStorage.setStringList('ff_searchHistory', _value);
  }

  void deleteSearchHistory() {
    secureStorage.delete(key: 'ff_searchHistory');
  }

  void addToSearchHistory(String _value) {
    _searchHistory.add(_value);
    secureStorage.setStringList('ff_searchHistory', _searchHistory);
  }

  void removeFromSearchHistory(String _value) {
    _searchHistory.remove(_value);
    secureStorage.setStringList('ff_searchHistory', _searchHistory);
  }

  void removeAtIndexFromSearchHistory(int _index) {
    _searchHistory.removeAt(_index);
    secureStorage.setStringList('ff_searchHistory', _searchHistory);
  }

  void updateSearchHistoryAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _searchHistory[_index] = updateFn(_searchHistory[_index]);
    secureStorage.setStringList('ff_searchHistory', _searchHistory);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
