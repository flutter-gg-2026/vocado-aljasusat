// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voice_task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoiceTaskModel {

 String get title; String get description;@JsonKey(name: 'assigned_to') String get assignedTo;@JsonKey(name: 'assigned_by') String get assignedBy; DateTime get deadline; String get status;
/// Create a copy of VoiceTaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoiceTaskModelCopyWith<VoiceTaskModel> get copyWith => _$VoiceTaskModelCopyWithImpl<VoiceTaskModel>(this as VoiceTaskModel, _$identity);

  /// Serializes this VoiceTaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoiceTaskModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,assignedTo,assignedBy,deadline,status);

@override
String toString() {
  return 'VoiceTaskModel(title: $title, description: $description, assignedTo: $assignedTo, assignedBy: $assignedBy, deadline: $deadline, status: $status)';
}


}

/// @nodoc
abstract mixin class $VoiceTaskModelCopyWith<$Res>  {
  factory $VoiceTaskModelCopyWith(VoiceTaskModel value, $Res Function(VoiceTaskModel) _then) = _$VoiceTaskModelCopyWithImpl;
@useResult
$Res call({
 String title, String description,@JsonKey(name: 'assigned_to') String assignedTo,@JsonKey(name: 'assigned_by') String assignedBy, DateTime deadline, String status
});




}
/// @nodoc
class _$VoiceTaskModelCopyWithImpl<$Res>
    implements $VoiceTaskModelCopyWith<$Res> {
  _$VoiceTaskModelCopyWithImpl(this._self, this._then);

  final VoiceTaskModel _self;
  final $Res Function(VoiceTaskModel) _then;

/// Create a copy of VoiceTaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? description = null,Object? assignedTo = null,Object? assignedBy = null,Object? deadline = null,Object? status = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,assignedTo: null == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String,assignedBy: null == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VoiceTaskModel].
extension VoiceTaskModelPatterns on VoiceTaskModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoiceTaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoiceTaskModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoiceTaskModel value)  $default,){
final _that = this;
switch (_that) {
case _VoiceTaskModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoiceTaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _VoiceTaskModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String description, @JsonKey(name: 'assigned_to')  String assignedTo, @JsonKey(name: 'assigned_by')  String assignedBy,  DateTime deadline,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoiceTaskModel() when $default != null:
return $default(_that.title,_that.description,_that.assignedTo,_that.assignedBy,_that.deadline,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String description, @JsonKey(name: 'assigned_to')  String assignedTo, @JsonKey(name: 'assigned_by')  String assignedBy,  DateTime deadline,  String status)  $default,) {final _that = this;
switch (_that) {
case _VoiceTaskModel():
return $default(_that.title,_that.description,_that.assignedTo,_that.assignedBy,_that.deadline,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String description, @JsonKey(name: 'assigned_to')  String assignedTo, @JsonKey(name: 'assigned_by')  String assignedBy,  DateTime deadline,  String status)?  $default,) {final _that = this;
switch (_that) {
case _VoiceTaskModel() when $default != null:
return $default(_that.title,_that.description,_that.assignedTo,_that.assignedBy,_that.deadline,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoiceTaskModel implements VoiceTaskModel {
  const _VoiceTaskModel({required this.title, required this.description, @JsonKey(name: 'assigned_to') required this.assignedTo, @JsonKey(name: 'assigned_by') required this.assignedBy, required this.deadline, required this.status});
  factory _VoiceTaskModel.fromJson(Map<String, dynamic> json) => _$VoiceTaskModelFromJson(json);

@override final  String title;
@override final  String description;
@override@JsonKey(name: 'assigned_to') final  String assignedTo;
@override@JsonKey(name: 'assigned_by') final  String assignedBy;
@override final  DateTime deadline;
@override final  String status;

/// Create a copy of VoiceTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoiceTaskModelCopyWith<_VoiceTaskModel> get copyWith => __$VoiceTaskModelCopyWithImpl<_VoiceTaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoiceTaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoiceTaskModel&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,description,assignedTo,assignedBy,deadline,status);

@override
String toString() {
  return 'VoiceTaskModel(title: $title, description: $description, assignedTo: $assignedTo, assignedBy: $assignedBy, deadline: $deadline, status: $status)';
}


}

/// @nodoc
abstract mixin class _$VoiceTaskModelCopyWith<$Res> implements $VoiceTaskModelCopyWith<$Res> {
  factory _$VoiceTaskModelCopyWith(_VoiceTaskModel value, $Res Function(_VoiceTaskModel) _then) = __$VoiceTaskModelCopyWithImpl;
@override @useResult
$Res call({
 String title, String description,@JsonKey(name: 'assigned_to') String assignedTo,@JsonKey(name: 'assigned_by') String assignedBy, DateTime deadline, String status
});




}
/// @nodoc
class __$VoiceTaskModelCopyWithImpl<$Res>
    implements _$VoiceTaskModelCopyWith<$Res> {
  __$VoiceTaskModelCopyWithImpl(this._self, this._then);

  final _VoiceTaskModel _self;
  final $Res Function(_VoiceTaskModel) _then;

/// Create a copy of VoiceTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? assignedTo = null,Object? assignedBy = null,Object? deadline = null,Object? status = null,}) {
  return _then(_VoiceTaskModel(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,assignedTo: null == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String,assignedBy: null == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
