// Mocks generated by Mockito 5.4.5 from annotations
// in ecommerce/test/helper/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;

import 'package:dartz/dartz.dart' as _i8;
import 'package:ecommerce/core/error/failure.dart' as _i11;
import 'package:ecommerce/core/network/network_info.dart' as _i7;
import 'package:ecommerce/feature/product/data/datasources/product_local_data_source.dart'
    as _i6;
import 'package:ecommerce/feature/product/data/datasources/product_remote_data_source.dart'
    as _i5;
import 'package:ecommerce/feature/product/data/models/product_model.dart'
    as _i3;
import 'package:ecommerce/feature/product/data/repositories/product_repository_impl.dart'
    as _i10;
import 'package:ecommerce/feature/product/domain/entities/product.dart' as _i4;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeDuration_0 extends _i1.SmartFake implements Duration {
  _FakeDuration_0(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeAddressCheckResult_1 extends _i1.SmartFake
    implements _i2.AddressCheckResult {
  _FakeAddressCheckResult_1(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeProductModel_2 extends _i1.SmartFake implements _i3.ProductModel {
  _FakeProductModel_2(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeProduct_3 extends _i1.SmartFake implements _i4.Product {
  _FakeProduct_3(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeProductRemoteDataSource_4 extends _i1.SmartFake
    implements _i5.ProductRemoteDataSource {
  _FakeProductRemoteDataSource_4(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeProductLocalDataSource_5 extends _i1.SmartFake
    implements _i6.ProductLocalDataSource {
  _FakeProductLocalDataSource_5(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeNetworkInfo_6 extends _i1.SmartFake implements _i7.NetworkInfo {
  _FakeNetworkInfo_6(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

class _FakeEither_7<L, R> extends _i1.SmartFake implements _i8.Either<L, R> {
  _FakeEither_7(Object parent, Invocation parentInvocation)
    : super(parent, parentInvocation);
}

/// A class which mocks [InternetConnectionChecker].
///
/// See the documentation for Mockito's code generation for more information.
class MockInternetConnectionChecker extends _i1.Mock
    implements _i2.InternetConnectionChecker {
  MockInternetConnectionChecker() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get requireAllAddressesToRespond =>
      (super.noSuchMethod(
            Invocation.getter(#requireAllAddressesToRespond),
            returnValue: false,
          )
          as bool);

  @override
  set requireAllAddressesToRespond(bool? _requireAllAddressesToRespond) =>
      super.noSuchMethod(
        Invocation.setter(
          #requireAllAddressesToRespond,
          _requireAllAddressesToRespond,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get enableToCheckForSlowConnection =>
      (super.noSuchMethod(
            Invocation.getter(#enableToCheckForSlowConnection),
            returnValue: false,
          )
          as bool);

  @override
  set enableToCheckForSlowConnection(bool? _enableToCheckForSlowConnection) =>
      super.noSuchMethod(
        Invocation.setter(
          #enableToCheckForSlowConnection,
          _enableToCheckForSlowConnection,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Duration get slowConnectionThreshold =>
      (super.noSuchMethod(
            Invocation.getter(#slowConnectionThreshold),
            returnValue: _FakeDuration_0(
              this,
              Invocation.getter(#slowConnectionThreshold),
            ),
          )
          as Duration);

  @override
  set slowConnectionThreshold(Duration? _slowConnectionThreshold) =>
      super.noSuchMethod(
        Invocation.setter(#slowConnectionThreshold, _slowConnectionThreshold),
        returnValueForMissingStub: null,
      );

  @override
  Duration get checkTimeout =>
      (super.noSuchMethod(
            Invocation.getter(#checkTimeout),
            returnValue: _FakeDuration_0(
              this,
              Invocation.getter(#checkTimeout),
            ),
          )
          as Duration);

  @override
  set checkTimeout(Duration? _checkTimeout) => super.noSuchMethod(
    Invocation.setter(#checkTimeout, _checkTimeout),
    returnValueForMissingStub: null,
  );

  @override
  Duration get checkInterval =>
      (super.noSuchMethod(
            Invocation.getter(#checkInterval),
            returnValue: _FakeDuration_0(
              this,
              Invocation.getter(#checkInterval),
            ),
          )
          as Duration);

  @override
  set checkInterval(Duration? _checkInterval) => super.noSuchMethod(
    Invocation.setter(#checkInterval, _checkInterval),
    returnValueForMissingStub: null,
  );

  @override
  List<_i2.AddressCheckOption> get addresses =>
      (super.noSuchMethod(
            Invocation.getter(#addresses),
            returnValue: <_i2.AddressCheckOption>[],
          )
          as List<_i2.AddressCheckOption>);

  @override
  set addresses(List<_i2.AddressCheckOption>? value) => super.noSuchMethod(
    Invocation.setter(#addresses, value),
    returnValueForMissingStub: null,
  );

  @override
  _i9.Stream<_i2.InternetConnectionStatus> get onStatusChange =>
      (super.noSuchMethod(
            Invocation.getter(#onStatusChange),
            returnValue: _i9.Stream<_i2.InternetConnectionStatus>.empty(),
          )
          as _i9.Stream<_i2.InternetConnectionStatus>);

  @override
  bool get hasListeners =>
      (super.noSuchMethod(Invocation.getter(#hasListeners), returnValue: false)
          as bool);

  @override
  _i9.Future<bool> get hasConnection =>
      (super.noSuchMethod(
            Invocation.getter(#hasConnection),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<_i2.InternetConnectionStatus> get connectionStatus =>
      (super.noSuchMethod(
            Invocation.getter(#connectionStatus),
            returnValue: _i9.Future<_i2.InternetConnectionStatus>.value(
              _i2.InternetConnectionStatus.connected,
            ),
          )
          as _i9.Future<_i2.InternetConnectionStatus>);

  @override
  set setLastStatus(_i2.InternetConnectionStatus? status) => super.noSuchMethod(
    Invocation.setter(#setLastStatus, status),
    returnValueForMissingStub: null,
  );

  @override
  set setRequireAllAddressesToRespond(bool? value) => super.noSuchMethod(
    Invocation.setter(#setRequireAllAddressesToRespond, value),
    returnValueForMissingStub: null,
  );

  @override
  Iterable<_i9.Future<_i2.AddressCheckResult>> createAddressCheckFutures(
    List<_i2.AddressCheckOption>? addresses,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#createAddressCheckFutures, [addresses]),
            returnValue: <_i9.Future<_i2.AddressCheckResult>>[],
          )
          as Iterable<_i9.Future<_i2.AddressCheckResult>>);

  @override
  _i9.Future<bool> checkConnectivity() =>
      (super.noSuchMethod(
            Invocation.method(#checkConnectivity, []),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<_i2.AddressCheckResult> isHostReachable(
    _i2.AddressCheckOption? option,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#isHostReachable, [option]),
            returnValue: _i9.Future<_i2.AddressCheckResult>.value(
              _FakeAddressCheckResult_1(
                this,
                Invocation.method(#isHostReachable, [option]),
              ),
            ),
          )
          as _i9.Future<_i2.AddressCheckResult>);

  @override
  _i9.Future<void> maybeEmitStatusUpdate({
    _i9.Timer? timer,
    Function? cancelCallback,
  }) =>
      (super.noSuchMethod(
            Invocation.method(#maybeEmitStatusUpdate, [], {
              #timer: timer,
              #cancelCallback: cancelCallback,
            }),
            returnValue: _i9.Future<void>.value(),
            returnValueForMissingStub: _i9.Future<void>.value(),
          )
          as _i9.Future<void>);

  @override
  void emitStatus(_i2.InternetConnectionStatus? newStatus) =>
      super.noSuchMethod(
        Invocation.method(#emitStatus, [newStatus]),
        returnValueForMissingStub: null,
      );

  @override
  void startMonitoring() => super.noSuchMethod(
    Invocation.method(#startMonitoring, []),
    returnValueForMissingStub: null,
  );

  @override
  void cancelStatusUpdate() => super.noSuchMethod(
    Invocation.method(#cancelStatusUpdate, []),
    returnValueForMissingStub: null,
  );

  @override
  void configure({
    Duration? timeout,
    Duration? interval,
    List<_i2.AddressCheckOption>? addresses,
    _i2.SlowConnectionConfig? slowConnectionConfig,
  }) => super.noSuchMethod(
    Invocation.method(#configure, [], {
      #timeout: timeout,
      #interval: interval,
      #addresses: addresses,
      #slowConnectionConfig: slowConnectionConfig,
    }),
    returnValueForMissingStub: null,
  );

  @override
  void dispose() => super.noSuchMethod(
    Invocation.method(#dispose, []),
    returnValueForMissingStub: null,
  );
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i7.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<bool> get isConnected =>
      (super.noSuchMethod(
            Invocation.getter(#isConnected),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);
}

/// A class which mocks [ProductRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRemoteDataSource extends _i1.Mock
    implements _i5.ProductRemoteDataSource {
  MockProductRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i3.ProductModel> getProduct(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#getProduct, [id]),
            returnValue: _i9.Future<_i3.ProductModel>.value(
              _FakeProductModel_2(this, Invocation.method(#getProduct, [id])),
            ),
          )
          as _i9.Future<_i3.ProductModel>);

  @override
  _i9.Future<_i3.ProductModel> insertProduct(_i4.Product? product) =>
      (super.noSuchMethod(
            Invocation.method(#insertProduct, [product]),
            returnValue: _i9.Future<_i3.ProductModel>.value(
              _FakeProductModel_2(
                this,
                Invocation.method(#insertProduct, [product]),
              ),
            ),
          )
          as _i9.Future<_i3.ProductModel>);

  @override
  _i9.Future<_i3.ProductModel> updateProduct(int? id, _i4.Product? product) =>
      (super.noSuchMethod(
            Invocation.method(#updateProduct, [id, product]),
            returnValue: _i9.Future<_i3.ProductModel>.value(
              _FakeProductModel_2(
                this,
                Invocation.method(#updateProduct, [id, product]),
              ),
            ),
          )
          as _i9.Future<_i3.ProductModel>);

  @override
  _i9.Future<void> deleteProduct(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#deleteProduct, [id]),
            returnValue: _i9.Future<void>.value(),
            returnValueForMissingStub: _i9.Future<void>.value(),
          )
          as _i9.Future<void>);
}

/// A class which mocks [ProductLocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductLocalDataSource extends _i1.Mock
    implements _i6.ProductLocalDataSource {
  MockProductLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i9.Future<_i4.Product> getCachedProduct() =>
      (super.noSuchMethod(
            Invocation.method(#getCachedProduct, []),
            returnValue: _i9.Future<_i4.Product>.value(
              _FakeProduct_3(this, Invocation.method(#getCachedProduct, [])),
            ),
          )
          as _i9.Future<_i4.Product>);

  @override
  _i9.Future<void> cacheProduct(_i3.ProductModel? product) =>
      (super.noSuchMethod(
            Invocation.method(#cacheProduct, [product]),
            returnValue: _i9.Future<void>.value(),
            returnValueForMissingStub: _i9.Future<void>.value(),
          )
          as _i9.Future<void>);
}

/// A class which mocks [ProductRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockProductRepositoryImpl extends _i1.Mock
    implements _i10.ProductRepositoryImpl {
  MockProductRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.ProductRemoteDataSource get remoteDataSource =>
      (super.noSuchMethod(
            Invocation.getter(#remoteDataSource),
            returnValue: _FakeProductRemoteDataSource_4(
              this,
              Invocation.getter(#remoteDataSource),
            ),
          )
          as _i5.ProductRemoteDataSource);

  @override
  _i6.ProductLocalDataSource get localDataSource =>
      (super.noSuchMethod(
            Invocation.getter(#localDataSource),
            returnValue: _FakeProductLocalDataSource_5(
              this,
              Invocation.getter(#localDataSource),
            ),
          )
          as _i6.ProductLocalDataSource);

  @override
  _i7.NetworkInfo get networkInfo =>
      (super.noSuchMethod(
            Invocation.getter(#networkInfo),
            returnValue: _FakeNetworkInfo_6(
              this,
              Invocation.getter(#networkInfo),
            ),
          )
          as _i7.NetworkInfo);

  @override
  _i9.Future<_i8.Either<_i11.Failure, _i4.Product>> getProduct(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#getProduct, [id]),
            returnValue:
                _i9.Future<_i8.Either<_i11.Failure, _i4.Product>>.value(
                  _FakeEither_7<_i11.Failure, _i4.Product>(
                    this,
                    Invocation.method(#getProduct, [id]),
                  ),
                ),
          )
          as _i9.Future<_i8.Either<_i11.Failure, _i4.Product>>);

  @override
  _i9.Future<_i8.Either<_i11.Failure, _i4.Product>> insertProduct(
    _i4.Product? product,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#insertProduct, [product]),
            returnValue:
                _i9.Future<_i8.Either<_i11.Failure, _i4.Product>>.value(
                  _FakeEither_7<_i11.Failure, _i4.Product>(
                    this,
                    Invocation.method(#insertProduct, [product]),
                  ),
                ),
          )
          as _i9.Future<_i8.Either<_i11.Failure, _i4.Product>>);

  @override
  _i9.Future<_i8.Either<_i11.Failure, _i4.Product>> updateProduct(
    int? id,
    _i4.Product? product,
  ) =>
      (super.noSuchMethod(
            Invocation.method(#updateProduct, [id, product]),
            returnValue:
                _i9.Future<_i8.Either<_i11.Failure, _i4.Product>>.value(
                  _FakeEither_7<_i11.Failure, _i4.Product>(
                    this,
                    Invocation.method(#updateProduct, [id, product]),
                  ),
                ),
          )
          as _i9.Future<_i8.Either<_i11.Failure, _i4.Product>>);

  @override
  _i9.Future<_i8.Either<_i11.Failure, void>> deleteProduct(int? id) =>
      (super.noSuchMethod(
            Invocation.method(#deleteProduct, [id]),
            returnValue: _i9.Future<_i8.Either<_i11.Failure, void>>.value(
              _FakeEither_7<_i11.Failure, void>(
                this,
                Invocation.method(#deleteProduct, [id]),
              ),
            ),
          )
          as _i9.Future<_i8.Either<_i11.Failure, void>>);
}

/// A class which mocks [SharedPreferences].
///
/// See the documentation for Mockito's code generation for more information.
class MockSharedPreferences extends _i1.Mock implements _i12.SharedPreferences {
  MockSharedPreferences() {
    _i1.throwOnMissingStub(this);
  }

  @override
  Set<String> getKeys() =>
      (super.noSuchMethod(
            Invocation.method(#getKeys, []),
            returnValue: <String>{},
          )
          as Set<String>);

  @override
  Object? get(String? key) =>
      (super.noSuchMethod(Invocation.method(#get, [key])) as Object?);

  @override
  bool? getBool(String? key) =>
      (super.noSuchMethod(Invocation.method(#getBool, [key])) as bool?);

  @override
  int? getInt(String? key) =>
      (super.noSuchMethod(Invocation.method(#getInt, [key])) as int?);

  @override
  double? getDouble(String? key) =>
      (super.noSuchMethod(Invocation.method(#getDouble, [key])) as double?);

  @override
  String? getString(String? key) =>
      (super.noSuchMethod(Invocation.method(#getString, [key])) as String?);

  @override
  bool containsKey(String? key) =>
      (super.noSuchMethod(
            Invocation.method(#containsKey, [key]),
            returnValue: false,
          )
          as bool);

  @override
  List<String>? getStringList(String? key) =>
      (super.noSuchMethod(Invocation.method(#getStringList, [key]))
          as List<String>?);

  @override
  _i9.Future<bool> setBool(String? key, bool? value) =>
      (super.noSuchMethod(
            Invocation.method(#setBool, [key, value]),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<bool> setInt(String? key, int? value) =>
      (super.noSuchMethod(
            Invocation.method(#setInt, [key, value]),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<bool> setDouble(String? key, double? value) =>
      (super.noSuchMethod(
            Invocation.method(#setDouble, [key, value]),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<bool> setString(String? key, String? value) =>
      (super.noSuchMethod(
            Invocation.method(#setString, [key, value]),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<bool> setStringList(String? key, List<String>? value) =>
      (super.noSuchMethod(
            Invocation.method(#setStringList, [key, value]),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<bool> remove(String? key) =>
      (super.noSuchMethod(
            Invocation.method(#remove, [key]),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<bool> commit() =>
      (super.noSuchMethod(
            Invocation.method(#commit, []),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<bool> clear() =>
      (super.noSuchMethod(
            Invocation.method(#clear, []),
            returnValue: _i9.Future<bool>.value(false),
          )
          as _i9.Future<bool>);

  @override
  _i9.Future<void> reload() =>
      (super.noSuchMethod(
            Invocation.method(#reload, []),
            returnValue: _i9.Future<void>.value(),
            returnValueForMissingStub: _i9.Future<void>.value(),
          )
          as _i9.Future<void>);
}
