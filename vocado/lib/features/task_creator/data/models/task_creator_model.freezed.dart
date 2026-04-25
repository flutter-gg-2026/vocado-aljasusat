// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_creator_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskCreatorModel {

 int get id; String get userId; String get name; String get dueDate; String get status; String? get assigneeName; String? get assignedBy; String? get description;
/// Create a copy of TaskCreatorModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCreatorModelCopyWith<TaskCreatorModel> get copyWith => _$TaskCreatorModelCopyWithImpl<TaskCreatorModel>(this as TaskCreatorModel, _$identity);

  /// Serializes this TaskCreatorModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskCreatorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.assigneeName, assigneeName) || other.assigneeName == assigneeName)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,dueDate,status,assigneeName,assignedBy,description);

@override
String toString() {
  return 'TaskCreatorModel(id: $id, userId: $userId, name: $name, dueDate: $dueDate, status: $status, assigneeName: $assigneeName, assignedBy: $assignedBy, description: $description)';
}


}

/// @nodoc
abstract mixin class $TaskCreatorModelCopyWith<$Res>  {
  factory $TaskCreatorModelCopyWith(TaskCreatorModel value, $Res Function(TaskCreatorModel) _then) = _$TaskCreatorModelCopyWithImpl;
@useResult
$Res call({
 int id, String userId, String name, String dueDate, String status, String? assigneeName, String? assignedBy, String? description
});




}
/// @nodoc
class _$TaskCreatorModelCopyWithImpl<$Res>
    implements $TaskCreatorModelCopyWith<$Res> {
  _$TaskCreatorModelCopyWithImpl(this._self, this._then);

  final TaskCreatorModel _self;
  final $Res Function(TaskCreatorModel) _then;

/// Create a copy of TaskCreatorModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? dueDate = null,Object? status = null,Object? assigneeName = freezed,Object? assignedBy = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,assigneeName: freezed == assigneeName ? _self.assigneeName : assigneeName // ignore: cast_nullable_to_non_nullable
as String?,assignedBy: freezed == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskCreatorModel].
extension TaskCreatorModelPatterns on TaskCreatorModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskCreatorModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskCreatorModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskCreatorModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskCreatorModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskCreatorModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskCreatorModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String userId,  String name,  String dueDate,  String status,  String? assigneeName,  String? assignedBy,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskCreatorModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.dueDate,_that.status,_that.assigneeName,_that.assignedBy,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String userId,  String name,  String dueDate,  String status,  String? assigneeName,  String? assignedBy,  String? description)  $default,) {final _that = this;
switch (_that) {
case _TaskCreatorModel():
return $default(_that.id,_that.userId,_that.name,_that.dueDate,_that.status,_that.assigneeName,_that.assignedBy,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String userId,  String name,  String dueDate,  String status,  String? assigneeName,  String? assignedBy,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _TaskCreatorModel() when $default != null:
return $default(_that.id,_that.userId,_that.name,_that.dueDate,_that.status,_that.assigneeName,_that.assignedBy,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskCreatorModel implements TaskCreatorModel {
  const _TaskCreatorModel({required this.id, required this.userId, required this.name, required this.dueDate, this.status = 'Pending', this.assigneeName, this.assignedBy, this.description});
  factory _TaskCreatorModel.fromJson(Map<String, dynamic> json) => _$TaskCreatorModelFromJson(json);

@override final  int id;
@override final  String userId;
@override final  String name;
@override final  String dueDate;
@override@JsonKey() final  String status;
@override final  String? assigneeName;
@override final  String? assignedBy;
@override final  String? description;

/// Create a copy of TaskCreatorModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCreatorModelCopyWith<_TaskCreatorModel> get copyWith => __$TaskCreatorModelCopyWithImpl<_TaskCreatorModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskCreatorModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskCreatorModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.assigneeName, assigneeName) || other.assigneeName == assigneeName)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,name,dueDate,status,assigneeName,assignedBy,description);

@override
String toString() {
  return 'TaskCreatorModel(id: $id, userId: $userId, name: $name, dueDate: $dueDate, status: $status, assigneeName: $assigneeName, assignedBy: $assignedBy, description: $description)';
}


}

/// @nodoc
abstract mixin class _$TaskCreatorModelCopyWith<$Res> implements $TaskCreatorModelCopyWith<$Res> {
  factory _$TaskCreatorModelCopyWith(_TaskCreatorModel value, $Res Function(_TaskCreatorModel) _then) = __$TaskCreatorModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String userId, String name, String dueDate, String status, String? assigneeName, String? assignedBy, String? description
});




}
/// @nodoc
class __$TaskCreatorModelCopyWithImpl<$Res>
    implements _$TaskCreatorModelCopyWith<$Res> {
  __$TaskCreatorModelCopyWithImpl(this._self, this._then);

  final _TaskCreatorModel _self;
  final $Res Function(_TaskCreatorModel) _then;

/// Create a copy of TaskCreatorModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? name = null,Object? dueDate = null,Object? status = null,Object? assigneeName = freezed,Object? assignedBy = freezed,Object? description = freezed,}) {
  return _then(_TaskCreatorModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,dueDate: null == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,assigneeName: freezed == assigneeName ? _self.assigneeName : assigneeName // ignore: cast_nullable_to_non_nullable
as String?,assignedBy: freezed == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
