// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_filter_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskFilterModel {

 int get id; String get title; String get description; String get assignedBy; DateTime get deadline; String get status;
/// Create a copy of TaskFilterModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskFilterModelCopyWith<TaskFilterModel> get copyWith => _$TaskFilterModelCopyWithImpl<TaskFilterModel>(this as TaskFilterModel, _$identity);

  /// Serializes this TaskFilterModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskFilterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,assignedBy,deadline,status);

@override
String toString() {
  return 'TaskFilterModel(id: $id, title: $title, description: $description, assignedBy: $assignedBy, deadline: $deadline, status: $status)';
}


}

/// @nodoc
abstract mixin class $TaskFilterModelCopyWith<$Res>  {
  factory $TaskFilterModelCopyWith(TaskFilterModel value, $Res Function(TaskFilterModel) _then) = _$TaskFilterModelCopyWithImpl;
@useResult
$Res call({
 int id, String title, String description, String assignedBy, DateTime deadline, String status
});




}
/// @nodoc
class _$TaskFilterModelCopyWithImpl<$Res>
    implements $TaskFilterModelCopyWith<$Res> {
  _$TaskFilterModelCopyWithImpl(this._self, this._then);

  final TaskFilterModel _self;
  final $Res Function(TaskFilterModel) _then;

/// Create a copy of TaskFilterModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? assignedBy = null,Object? deadline = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,assignedBy: null == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskFilterModel].
extension TaskFilterModelPatterns on TaskFilterModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskFilterModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskFilterModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskFilterModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskFilterModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskFilterModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskFilterModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String assignedBy,  DateTime deadline,  String status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskFilterModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.assignedBy,_that.deadline,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String title,  String description,  String assignedBy,  DateTime deadline,  String status)  $default,) {final _that = this;
switch (_that) {
case _TaskFilterModel():
return $default(_that.id,_that.title,_that.description,_that.assignedBy,_that.deadline,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String title,  String description,  String assignedBy,  DateTime deadline,  String status)?  $default,) {final _that = this;
switch (_that) {
case _TaskFilterModel() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.assignedBy,_that.deadline,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskFilterModel implements TaskFilterModel {
  const _TaskFilterModel({required this.id, required this.title, required this.description, required this.assignedBy, required this.deadline, required this.status});
  factory _TaskFilterModel.fromJson(Map<String, dynamic> json) => _$TaskFilterModelFromJson(json);

@override final  int id;
@override final  String title;
@override final  String description;
@override final  String assignedBy;
@override final  DateTime deadline;
@override final  String status;

/// Create a copy of TaskFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskFilterModelCopyWith<_TaskFilterModel> get copyWith => __$TaskFilterModelCopyWithImpl<_TaskFilterModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskFilterModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskFilterModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.assignedBy, assignedBy) || other.assignedBy == assignedBy)&&(identical(other.deadline, deadline) || other.deadline == deadline)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,assignedBy,deadline,status);

@override
String toString() {
  return 'TaskFilterModel(id: $id, title: $title, description: $description, assignedBy: $assignedBy, deadline: $deadline, status: $status)';
}


}

/// @nodoc
abstract mixin class _$TaskFilterModelCopyWith<$Res> implements $TaskFilterModelCopyWith<$Res> {
  factory _$TaskFilterModelCopyWith(_TaskFilterModel value, $Res Function(_TaskFilterModel) _then) = __$TaskFilterModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String title, String description, String assignedBy, DateTime deadline, String status
});




}
/// @nodoc
class __$TaskFilterModelCopyWithImpl<$Res>
    implements _$TaskFilterModelCopyWith<$Res> {
  __$TaskFilterModelCopyWithImpl(this._self, this._then);

  final _TaskFilterModel _self;
  final $Res Function(_TaskFilterModel) _then;

/// Create a copy of TaskFilterModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? assignedBy = null,Object? deadline = null,Object? status = null,}) {
  return _then(_TaskFilterModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,assignedBy: null == assignedBy ? _self.assignedBy : assignedBy // ignore: cast_nullable_to_non_nullable
as String,deadline: null == deadline ? _self.deadline : deadline // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
