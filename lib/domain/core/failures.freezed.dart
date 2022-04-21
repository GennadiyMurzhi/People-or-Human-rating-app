// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ServerFailureTearOff {
  const _$ServerFailureTearOff();

  ServerError serverError({required int statusCode}) {
    return ServerError(
      statusCode: statusCode,
    );
  }

  NoInternetConnection noInternetConnection() {
    return const NoInternetConnection();
  }
}

/// @nodoc
const $ServerFailure = _$ServerFailureTearOff();

/// @nodoc
mixin _$ServerFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode) serverError,
    required TResult Function() noInternetConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int statusCode)? serverError,
    TResult Function()? noInternetConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode)? serverError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerFailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(
          ServerFailure value, $Res Function(ServerFailure) then) =
      _$ServerFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._value, this._then);

  final ServerFailure _value;
  // ignore: unused_field
  final $Res Function(ServerFailure) _then;
}

/// @nodoc
abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
  $Res call({int statusCode});
}

/// @nodoc
class _$ServerErrorCopyWithImpl<$Res> extends _$ServerFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;

  @override
  $Res call({
    Object? statusCode = freezed,
  }) {
    return _then(ServerError(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ServerError implements ServerError {
  const _$ServerError({required this.statusCode});

  @override
  final int statusCode;

  @override
  String toString() {
    return 'ServerFailure.serverError(statusCode: $statusCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ServerError &&
            const DeepCollectionEquality()
                .equals(other.statusCode, statusCode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(statusCode));

  @JsonKey(ignore: true)
  @override
  $ServerErrorCopyWith<ServerError> get copyWith =>
      _$ServerErrorCopyWithImpl<ServerError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode) serverError,
    required TResult Function() noInternetConnection,
  }) {
    return serverError(statusCode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int statusCode)? serverError,
    TResult Function()? noInternetConnection,
  }) {
    return serverError?.call(statusCode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode)? serverError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(statusCode);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements ServerFailure {
  const factory ServerError({required int statusCode}) = _$ServerError;

  int get statusCode;
  @JsonKey(ignore: true)
  $ServerErrorCopyWith<ServerError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NoInternetConnectionCopyWith<$Res> {
  factory $NoInternetConnectionCopyWith(NoInternetConnection value,
          $Res Function(NoInternetConnection) then) =
      _$NoInternetConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoInternetConnectionCopyWithImpl<$Res>
    extends _$ServerFailureCopyWithImpl<$Res>
    implements $NoInternetConnectionCopyWith<$Res> {
  _$NoInternetConnectionCopyWithImpl(
      NoInternetConnection _value, $Res Function(NoInternetConnection) _then)
      : super(_value, (v) => _then(v as NoInternetConnection));

  @override
  NoInternetConnection get _value => super._value as NoInternetConnection;
}

/// @nodoc

class _$NoInternetConnection implements NoInternetConnection {
  const _$NoInternetConnection();

  @override
  String toString() {
    return 'ServerFailure.noInternetConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoInternetConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int statusCode) serverError,
    required TResult Function() noInternetConnection,
  }) {
    return noInternetConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int statusCode)? serverError,
    TResult Function()? noInternetConnection,
  }) {
    return noInternetConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int statusCode)? serverError,
    TResult Function()? noInternetConnection,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NoInternetConnection value) noInternetConnection,
  }) {
    return noInternetConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
  }) {
    return noInternetConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NoInternetConnection value)? noInternetConnection,
    required TResult orElse(),
  }) {
    if (noInternetConnection != null) {
      return noInternetConnection(this);
    }
    return orElse();
  }
}

abstract class NoInternetConnection implements ServerFailure {
  const factory NoInternetConnection() = _$NoInternetConnection;
}

/// @nodoc
class _$CacheFailureTearOff {
  const _$CacheFailureTearOff();

  CacheError cacheError() {
    return const CacheError();
  }

  NoDataFound noDataFound() {
    return const NoDataFound();
  }
}

/// @nodoc
const $CacheFailure = _$CacheFailureTearOff();

/// @nodoc
mixin _$CacheFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cacheError,
    required TResult Function() noDataFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cacheError,
    TResult Function()? noDataFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cacheError,
    TResult Function()? noDataFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CacheError value) cacheError,
    required TResult Function(NoDataFound value) noDataFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CacheError value)? cacheError,
    TResult Function(NoDataFound value)? noDataFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheError value)? cacheError,
    TResult Function(NoDataFound value)? noDataFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CacheFailureCopyWith<$Res> {
  factory $CacheFailureCopyWith(
          CacheFailure value, $Res Function(CacheFailure) then) =
      _$CacheFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$CacheFailureCopyWithImpl<$Res> implements $CacheFailureCopyWith<$Res> {
  _$CacheFailureCopyWithImpl(this._value, this._then);

  final CacheFailure _value;
  // ignore: unused_field
  final $Res Function(CacheFailure) _then;
}

/// @nodoc
abstract class $CacheErrorCopyWith<$Res> {
  factory $CacheErrorCopyWith(
          CacheError value, $Res Function(CacheError) then) =
      _$CacheErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$CacheErrorCopyWithImpl<$Res> extends _$CacheFailureCopyWithImpl<$Res>
    implements $CacheErrorCopyWith<$Res> {
  _$CacheErrorCopyWithImpl(CacheError _value, $Res Function(CacheError) _then)
      : super(_value, (v) => _then(v as CacheError));

  @override
  CacheError get _value => super._value as CacheError;
}

/// @nodoc

class _$CacheError implements CacheError {
  const _$CacheError();

  @override
  String toString() {
    return 'CacheFailure.cacheError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CacheError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cacheError,
    required TResult Function() noDataFound,
  }) {
    return cacheError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cacheError,
    TResult Function()? noDataFound,
  }) {
    return cacheError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cacheError,
    TResult Function()? noDataFound,
    required TResult orElse(),
  }) {
    if (cacheError != null) {
      return cacheError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CacheError value) cacheError,
    required TResult Function(NoDataFound value) noDataFound,
  }) {
    return cacheError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CacheError value)? cacheError,
    TResult Function(NoDataFound value)? noDataFound,
  }) {
    return cacheError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheError value)? cacheError,
    TResult Function(NoDataFound value)? noDataFound,
    required TResult orElse(),
  }) {
    if (cacheError != null) {
      return cacheError(this);
    }
    return orElse();
  }
}

abstract class CacheError implements CacheFailure {
  const factory CacheError() = _$CacheError;
}

/// @nodoc
abstract class $NoDataFoundCopyWith<$Res> {
  factory $NoDataFoundCopyWith(
          NoDataFound value, $Res Function(NoDataFound) then) =
      _$NoDataFoundCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoDataFoundCopyWithImpl<$Res> extends _$CacheFailureCopyWithImpl<$Res>
    implements $NoDataFoundCopyWith<$Res> {
  _$NoDataFoundCopyWithImpl(
      NoDataFound _value, $Res Function(NoDataFound) _then)
      : super(_value, (v) => _then(v as NoDataFound));

  @override
  NoDataFound get _value => super._value as NoDataFound;
}

/// @nodoc

class _$NoDataFound implements NoDataFound {
  const _$NoDataFound();

  @override
  String toString() {
    return 'CacheFailure.noDataFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoDataFound);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() cacheError,
    required TResult Function() noDataFound,
  }) {
    return noDataFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? cacheError,
    TResult Function()? noDataFound,
  }) {
    return noDataFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? cacheError,
    TResult Function()? noDataFound,
    required TResult orElse(),
  }) {
    if (noDataFound != null) {
      return noDataFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CacheError value) cacheError,
    required TResult Function(NoDataFound value) noDataFound,
  }) {
    return noDataFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CacheError value)? cacheError,
    TResult Function(NoDataFound value)? noDataFound,
  }) {
    return noDataFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CacheError value)? cacheError,
    TResult Function(NoDataFound value)? noDataFound,
    required TResult orElse(),
  }) {
    if (noDataFound != null) {
      return noDataFound(this);
    }
    return orElse();
  }
}

abstract class NoDataFound implements CacheFailure {
  const factory NoDataFound() = _$NoDataFound;
}
