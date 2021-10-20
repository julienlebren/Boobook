// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subscription_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SubscriptionStateTearOff {
  const _$SubscriptionStateTearOff();

  _SubscriptionState call(
      {String? price,
      bool isReady = false,
      bool isLoading = false,
      bool isSuccess = false,
      String? errorText}) {
    return _SubscriptionState(
      price: price,
      isReady: isReady,
      isLoading: isLoading,
      isSuccess: isSuccess,
      errorText: errorText,
    );
  }
}

/// @nodoc
const $SubscriptionState = _$SubscriptionStateTearOff();

/// @nodoc
mixin _$SubscriptionState {
  String? get price => throw _privateConstructorUsedError;
  bool get isReady => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;
  String? get errorText => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubscriptionStateCopyWith<SubscriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionStateCopyWith<$Res> {
  factory $SubscriptionStateCopyWith(
          SubscriptionState value, $Res Function(SubscriptionState) then) =
      _$SubscriptionStateCopyWithImpl<$Res>;
  $Res call(
      {String? price,
      bool isReady,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class _$SubscriptionStateCopyWithImpl<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  _$SubscriptionStateCopyWithImpl(this._value, this._then);

  final SubscriptionState _value;
  // ignore: unused_field
  final $Res Function(SubscriptionState) _then;

  @override
  $Res call({
    Object? price = freezed,
    Object? isReady = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_value.copyWith(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      isReady: isReady == freezed
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$SubscriptionStateCopyWith<$Res>
    implements $SubscriptionStateCopyWith<$Res> {
  factory _$SubscriptionStateCopyWith(
          _SubscriptionState value, $Res Function(_SubscriptionState) then) =
      __$SubscriptionStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? price,
      bool isReady,
      bool isLoading,
      bool isSuccess,
      String? errorText});
}

/// @nodoc
class __$SubscriptionStateCopyWithImpl<$Res>
    extends _$SubscriptionStateCopyWithImpl<$Res>
    implements _$SubscriptionStateCopyWith<$Res> {
  __$SubscriptionStateCopyWithImpl(
      _SubscriptionState _value, $Res Function(_SubscriptionState) _then)
      : super(_value, (v) => _then(v as _SubscriptionState));

  @override
  _SubscriptionState get _value => super._value as _SubscriptionState;

  @override
  $Res call({
    Object? price = freezed,
    Object? isReady = freezed,
    Object? isLoading = freezed,
    Object? isSuccess = freezed,
    Object? errorText = freezed,
  }) {
    return _then(_SubscriptionState(
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      isReady: isReady == freezed
          ? _value.isReady
          : isReady // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: isSuccess == freezed
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      errorText: errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_SubscriptionState implements _SubscriptionState {
  const _$_SubscriptionState(
      {this.price,
      this.isReady = false,
      this.isLoading = false,
      this.isSuccess = false,
      this.errorText});

  @override
  final String? price;
  @JsonKey(defaultValue: false)
  @override
  final bool isReady;
  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isSuccess;
  @override
  final String? errorText;

  @override
  String toString() {
    return 'SubscriptionState(price: $price, isReady: $isReady, isLoading: $isLoading, isSuccess: $isSuccess, errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionState &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isReady, isReady) || other.isReady == isReady) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, price, isReady, isLoading, isSuccess, errorText);

  @JsonKey(ignore: true)
  @override
  _$SubscriptionStateCopyWith<_SubscriptionState> get copyWith =>
      __$SubscriptionStateCopyWithImpl<_SubscriptionState>(this, _$identity);
}

abstract class _SubscriptionState implements SubscriptionState {
  const factory _SubscriptionState(
      {String? price,
      bool isReady,
      bool isLoading,
      bool isSuccess,
      String? errorText}) = _$_SubscriptionState;

  @override
  String? get price;
  @override
  bool get isReady;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  String? get errorText;
  @override
  @JsonKey(ignore: true)
  _$SubscriptionStateCopyWith<_SubscriptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SubscriptionEventTearOff {
  const _$SubscriptionEventTearOff();

  _FetchOfferings fetchOfferings() {
    return const _FetchOfferings();
  }

  _Purchase purchase() {
    return const _Purchase();
  }

  _RestorePurchases restorePurchases() {
    return const _RestorePurchases();
  }
}

/// @nodoc
const $SubscriptionEvent = _$SubscriptionEventTearOff();

/// @nodoc
mixin _$SubscriptionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function() purchase,
    required TResult Function() restorePurchases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function()? purchase,
    TResult Function()? restorePurchases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function()? purchase,
    TResult Function()? restorePurchases,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionEventCopyWith<$Res> {
  factory $SubscriptionEventCopyWith(
          SubscriptionEvent value, $Res Function(SubscriptionEvent) then) =
      _$SubscriptionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SubscriptionEventCopyWithImpl<$Res>
    implements $SubscriptionEventCopyWith<$Res> {
  _$SubscriptionEventCopyWithImpl(this._value, this._then);

  final SubscriptionEvent _value;
  // ignore: unused_field
  final $Res Function(SubscriptionEvent) _then;
}

/// @nodoc
abstract class _$FetchOfferingsCopyWith<$Res> {
  factory _$FetchOfferingsCopyWith(
          _FetchOfferings value, $Res Function(_FetchOfferings) then) =
      __$FetchOfferingsCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchOfferingsCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res>
    implements _$FetchOfferingsCopyWith<$Res> {
  __$FetchOfferingsCopyWithImpl(
      _FetchOfferings _value, $Res Function(_FetchOfferings) _then)
      : super(_value, (v) => _then(v as _FetchOfferings));

  @override
  _FetchOfferings get _value => super._value as _FetchOfferings;
}

/// @nodoc

class _$_FetchOfferings implements _FetchOfferings {
  const _$_FetchOfferings();

  @override
  String toString() {
    return 'SubscriptionEvent.fetchOfferings()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchOfferings);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function() purchase,
    required TResult Function() restorePurchases,
  }) {
    return fetchOfferings();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function()? purchase,
    TResult Function()? restorePurchases,
  }) {
    return fetchOfferings?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function()? purchase,
    TResult Function()? restorePurchases,
    required TResult orElse(),
  }) {
    if (fetchOfferings != null) {
      return fetchOfferings();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
  }) {
    return fetchOfferings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
  }) {
    return fetchOfferings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    required TResult orElse(),
  }) {
    if (fetchOfferings != null) {
      return fetchOfferings(this);
    }
    return orElse();
  }
}

abstract class _FetchOfferings implements SubscriptionEvent {
  const factory _FetchOfferings() = _$_FetchOfferings;
}

/// @nodoc
abstract class _$PurchaseCopyWith<$Res> {
  factory _$PurchaseCopyWith(_Purchase value, $Res Function(_Purchase) then) =
      __$PurchaseCopyWithImpl<$Res>;
}

/// @nodoc
class __$PurchaseCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res>
    implements _$PurchaseCopyWith<$Res> {
  __$PurchaseCopyWithImpl(_Purchase _value, $Res Function(_Purchase) _then)
      : super(_value, (v) => _then(v as _Purchase));

  @override
  _Purchase get _value => super._value as _Purchase;
}

/// @nodoc

class _$_Purchase implements _Purchase {
  const _$_Purchase();

  @override
  String toString() {
    return 'SubscriptionEvent.purchase()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Purchase);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function() purchase,
    required TResult Function() restorePurchases,
  }) {
    return purchase();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function()? purchase,
    TResult Function()? restorePurchases,
  }) {
    return purchase?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function()? purchase,
    TResult Function()? restorePurchases,
    required TResult orElse(),
  }) {
    if (purchase != null) {
      return purchase();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
  }) {
    return purchase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
  }) {
    return purchase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    required TResult orElse(),
  }) {
    if (purchase != null) {
      return purchase(this);
    }
    return orElse();
  }
}

abstract class _Purchase implements SubscriptionEvent {
  const factory _Purchase() = _$_Purchase;
}

/// @nodoc
abstract class _$RestorePurchasesCopyWith<$Res> {
  factory _$RestorePurchasesCopyWith(
          _RestorePurchases value, $Res Function(_RestorePurchases) then) =
      __$RestorePurchasesCopyWithImpl<$Res>;
}

/// @nodoc
class __$RestorePurchasesCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res>
    implements _$RestorePurchasesCopyWith<$Res> {
  __$RestorePurchasesCopyWithImpl(
      _RestorePurchases _value, $Res Function(_RestorePurchases) _then)
      : super(_value, (v) => _then(v as _RestorePurchases));

  @override
  _RestorePurchases get _value => super._value as _RestorePurchases;
}

/// @nodoc

class _$_RestorePurchases implements _RestorePurchases {
  const _$_RestorePurchases();

  @override
  String toString() {
    return 'SubscriptionEvent.restorePurchases()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RestorePurchases);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchOfferings,
    required TResult Function() purchase,
    required TResult Function() restorePurchases,
  }) {
    return restorePurchases();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function()? purchase,
    TResult Function()? restorePurchases,
  }) {
    return restorePurchases?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchOfferings,
    TResult Function()? purchase,
    TResult Function()? restorePurchases,
    required TResult orElse(),
  }) {
    if (restorePurchases != null) {
      return restorePurchases();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchOfferings value) fetchOfferings,
    required TResult Function(_Purchase value) purchase,
    required TResult Function(_RestorePurchases value) restorePurchases,
  }) {
    return restorePurchases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
  }) {
    return restorePurchases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchOfferings value)? fetchOfferings,
    TResult Function(_Purchase value)? purchase,
    TResult Function(_RestorePurchases value)? restorePurchases,
    required TResult orElse(),
  }) {
    if (restorePurchases != null) {
      return restorePurchases(this);
    }
    return orElse();
  }
}

abstract class _RestorePurchases implements SubscriptionEvent {
  const factory _RestorePurchases() = _$_RestorePurchases;
}
