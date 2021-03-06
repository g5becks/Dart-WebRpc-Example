import 'dart:async';
import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';
import 'package:bloc/bloc.dart';

part 'example_service.freezed.dart';
part 'example_service.g.dart';

// example v0.0.1 8020254366f497d3c08759ae5f5c68f270d8ff1a
// --
// This file has been generated by https://github.com/webrpc/webrpc using gen/dart
// Do not edit by hand. Update your webrpc schema and re-generate.

// WebRPC description and code-gen version
String webRPCVersion() {
  return "v1";
}

// Schema version of your RIDL schema
String WebRPCSchemaVersion() {
  return "v0.0.1";
}

// Schema hash generated from your RIDL schema
String WebRPCSchemaHash() {
  return "8020254366f497d3c08759ae5f5c68f270d8ff1a";
}

// **********************************************************************
// MESSAGE TYPES.
// **********************************************************************
@freezed
abstract class Kind with _$Kind {
  const factory Kind.user() = USER;
  const factory Kind.admin() = ADMIN;
  factory Kind.fromJson(Map<String, dynamic> json) => _$KindFromJson(json);
}

@freezed
abstract class Empty with _$Empty {
  @JsonSerializable(explicitToJson: true)
  factory Empty() = _Empty;
  factory Empty.fromJson(Map<String, dynamic> json) => _$EmptyFromJson(json);
}

@freezed
abstract class User with _$User {
  @JsonSerializable(explicitToJson: true)
  factory User({
    @required int id,
    @JsonKey(name: 'USERNAME') @required String username,
    @required String role,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
abstract class SearchFilter with _$SearchFilter {
  @JsonSerializable(explicitToJson: true)
  factory SearchFilter({
    @required int id,
  }) = _SearchFilter;
  factory SearchFilter.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterFromJson(json);
}

@freezed
abstract class Version with _$Version {
  @JsonSerializable(explicitToJson: true)
  factory Version({
    @required String webrpcVersion,
    @required String schemaVersion,
    @required String schemaHash,
  }) = _Version;
  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
}

@freezed
abstract class ComplexType with _$ComplexType {
  @JsonSerializable(explicitToJson: true)
  factory ComplexType({
    @required Map<String, dynamic> meta,
    @required Map<String, Map<String, int>> metaNestedExample,
    @required List<String> namesList,
    @required List<int> numsList,
    @required List<List<String>> doubleArray,
    @required List<User> listOfUsers,
    @required Map<String, User> mapOfUsers,
    @required User user,
    List<Map<String, int>> listOfMaps,
  }) = _ComplexType;
  factory ComplexType.fromJson(Map<String, dynamic> json) =>
      _$ComplexTypeFromJson(json);
}

// *********************************************************************
// ExampleService METHOD ARGUMENT TYPES.
// *********************************************************************
@freezed
abstract class _GetUserArgs with _$_GetUserArgs {
  @JsonSerializable(explicitToJson: true)
  factory _GetUserArgs({
    @required int userID,
  }) = _GetUserArgs_Freezed;
  factory _GetUserArgs.fromJson(Map<String, dynamic> json) =>
      _$_GetUserArgsFromJson(json);
}

@freezed
abstract class _UpdateNameArgs with _$_UpdateNameArgs {
  @JsonSerializable(explicitToJson: true)
  factory _UpdateNameArgs({
    @required int id,
    @required String username,
  }) = _UpdateNameArgs_Freezed;
  factory _UpdateNameArgs.fromJson(Map<String, dynamic> json) =>
      _$_UpdateNameArgsFromJson(json);
}

@freezed
abstract class _FindUserByIdArgs with _$_FindUserByIdArgs {
  @JsonSerializable(explicitToJson: true)
  factory _FindUserByIdArgs({
    @required SearchFilter s,
  }) = _FindUserByIdArgs_Freezed;
  factory _FindUserByIdArgs.fromJson(Map<String, dynamic> json) =>
      _$_FindUserByIdArgsFromJson(json);
}

@freezed
abstract class _AddUserArgs with _$_AddUserArgs {
  @JsonSerializable(explicitToJson: true)
  factory _AddUserArgs({
    @required User user,
  }) = _AddUserArgs_Freezed;
  factory _AddUserArgs.fromJson(Map<String, dynamic> json) =>
      _$_AddUserArgsFromJson(json);
}

@freezed
abstract class _DeleteUserArgs with _$_DeleteUserArgs {
  @JsonSerializable(explicitToJson: true)
  factory _DeleteUserArgs({
    @required int id,
  }) = _DeleteUserArgs_Freezed;
  factory _DeleteUserArgs.fromJson(Map<String, dynamic> json) =>
      _$_DeleteUserArgsFromJson(json);
}

// **********************************************************************
// ExampleService Bloc Events.
// **********************************************************************

@freezed
abstract class ExampleServiceEvent with _$ExampleServiceEvent {
  factory ExampleServiceEvent.ping({
    Map<String, String> headers,
  }) = _PingEvent;
  factory ExampleServiceEvent.status({
    Map<String, String> headers,
  }) = _StatusEvent;
  factory ExampleServiceEvent.version({
    Map<String, String> headers,
  }) = _VersionEvent;
  factory ExampleServiceEvent.getUser({
    @required int userID,
    Map<String, String> headers,
  }) = _GetUserEvent;
  factory ExampleServiceEvent.updateName({
    @required int id,
    @required String username,
    Map<String, String> headers,
  }) = _UpdateNameEvent;
  factory ExampleServiceEvent.findUserById({
    @required SearchFilter s,
    Map<String, String> headers,
  }) = _FindUserByIdEvent;
  factory ExampleServiceEvent.addUser({
    @required User user,
    Map<String, String> headers,
  }) = _AddUserEvent;
  factory ExampleServiceEvent.listUsers({
    Map<String, String> headers,
  }) = _ListUsersEvent;
  factory ExampleServiceEvent.deleteUser({
    @required int id,
    Map<String, String> headers,
  }) = _DeleteUserEvent;
}

// ***********************************************************************
// ExampleService Bloc State.
// ***********************************************************************
@freezed
abstract class ExampleServiceState with _$ExampleServiceState {
  factory ExampleServiceState.pingResult() = PingResult;
  factory ExampleServiceState.statusResult({
    @required bool status,
  }) = StatusResult;
  factory ExampleServiceState.versionResult({
    @required Version version,
  }) = VersionResult;
  factory ExampleServiceState.getUserResult({
    @required User user,
  }) = GetUserResult;
  factory ExampleServiceState.updateNameResult({
    @required bool wasUpdated,
  }) = UpdateNameResult;
  factory ExampleServiceState.findUserByIdResult({
    @required String name,
    @required User user,
  }) = FindUserByIdResult;
  factory ExampleServiceState.addUserResult({
    @required bool wasAdded,
  }) = AddUserResult;
  factory ExampleServiceState.listUsersResult({
    @required List<User> users,
  }) = ListUsersResult;
  factory ExampleServiceState.deleteUserResult({
    @required bool wasDeleted,
  }) = DeleteUserResult;

  factory ExampleServiceState.fromJson(Map<String, dynamic> json) =>
      _$ExampleServiceStateFromJson(json);
}

// ***********************************************************************
// ExampleService Bloc.
// ***********************************************************************
class ExampleServiceBloc
    extends Bloc<ExampleServiceEvent, RpcState<ExampleServiceState>> {
  final ExampleService exampleService;
  ExampleServiceBloc({
    @required this.exampleService,
  });
  @override
  RpcState<ExampleServiceState> get initialState => const RpcState.idle();
  @override
  Stream<RpcState<ExampleServiceState>> mapEventToState(
    ExampleServiceEvent event,
  ) async* {
    yield* event.when(
      ping: (headers) => exampleService.ping(
        headers: headers,
      ),
      status: (headers) => exampleService.status(
        headers: headers,
      ),
      version: (headers) => exampleService.version(
        headers: headers,
      ),
      getUser: (userID, headers) => exampleService.getUser(
        userID: userID,
        headers: headers,
      ),
      updateName: (id, username, headers) => exampleService.updateName(
        id: id,
        username: username,
        headers: headers,
      ),
      findUserById: (s, headers) => exampleService.findUserById(
        s: s,
        headers: headers,
      ),
      addUser: (user, headers) => exampleService.addUser(
        user: user,
        headers: headers,
      ),
      listUsers: (headers) => exampleService.listUsers(
        headers: headers,
      ),
      deleteUser: (id, headers) => exampleService.deleteUser(
        id: id,
        headers: headers,
      ),
    );
  }

  void ping({
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.ping(
          headers: headers,
        ),
      );

  void status({
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.status(
          headers: headers,
        ),
      );

  void version({
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.version(
          headers: headers,
        ),
      );

  void getUser({
    @required int userID,
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.getUser(
          userID: userID,
          headers: headers,
        ),
      );

  void updateName({
    @required int id,
    @required String username,
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.updateName(
          id: id,
          username: username,
          headers: headers,
        ),
      );

  void findUserById({
    @required SearchFilter s,
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.findUserById(
          s: s,
          headers: headers,
        ),
      );

  void addUser({
    @required User user,
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.addUser(
          user: user,
          headers: headers,
        ),
      );

  void listUsers({
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.listUsers(
          headers: headers,
        ),
      );

  void deleteUser({
    @required int id,
    Map<String, String> headers,
  }) =>
      this.add(
        ExampleServiceEvent.deleteUser(
          id: id,
          headers: headers,
        ),
      );
}

// *********************************************************************
// Service Interfaces. Useful for testing purposes.
// *********************************************************************

abstract class ExampleService {
  Stream<RpcState<PingResult>> ping({
    Map<String, String> headers,
  });

  Stream<RpcState<StatusResult>> status({
    Map<String, String> headers,
  });

  Stream<RpcState<VersionResult>> version({
    Map<String, String> headers,
  });

  Stream<RpcState<GetUserResult>> getUser({
    @required int userID,
    Map<String, String> headers,
  });

  Stream<RpcState<UpdateNameResult>> updateName({
    @required int id,
    @required String username,
    Map<String, String> headers,
  });

  Stream<RpcState<FindUserByIdResult>> findUserById({
    @required SearchFilter s,
    Map<String, String> headers,
  });

  Stream<RpcState<AddUserResult>> addUser({
    @required User user,
    Map<String, String> headers,
  });

  Stream<RpcState<ListUsersResult>> listUsers({
    Map<String, String> headers,
  });

  Stream<RpcState<DeleteUserResult>> deleteUser({
    @required int id,
    Map<String, String> headers,
  });
}

// *********************************************************************
// RpcResponse TYPE.
// *********************************************************************

// This class provides type safe access to the state of an Rpc Request
// and it's Response data. Can be used easily with Bloc. For more info See https://www.azavea.com/blog/2019/12/12/modeling-state-with-typescript/
// See https://pub.dev/packages/freezed to learn how to use this type.
@freezed
abstract class RpcState<T> with _$RpcState<T> {
  // initial state prior to any request being made.
  const factory RpcState.idle() = _RpcStateIdle<T>;
  // request has been made and awaiting a response.
  const factory RpcState.loading() = _RpcStateLoading<T>;
  // request made and returned successfully with data.
  const factory RpcState.ok({
    @required T data,
  }) = _RpcStateOk<T>;
  // request made and returned successfully without data.
  const factory RpcState.unit() = _RpcStateUnit<T>;
  // request returned an error with a message and status code.
  // The optional stackTrace is useful for debugging exceptions
  // thrown in Rpc client methods.
  const factory RpcState.err({
    @required String reason,
    @required int statusCode,
    String stackTrace,
  }) = _RpcStateErr<T>;
}
// ***********************************************************************
// WEBRPC-DART SERVICE CLIENTS.
// ***********************************************************************

class ExampleServiceRpc implements ExampleService {
  final String host;
  final String _srvcPath;
  ExampleServiceRpc({
    @required this.host,
  }) : _srvcPath = '${_removeSlash(host)}/rpc/ExampleService';

  Future<http.Response> _makeRequest(
    String route, {
    dynamic json = "{}",
    Map<String, String> headers,
  }) {
    return http.post(
      '$_srvcPath/$route',
      headers: {
        ...?headers,
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(json),
    );
  }

  _RpcErr _getErr(http.Response r) {
    try {
      return _RpcErr.fromJson(jsonDecode(r.body));
    } on Exception catch (_) {
      return _RpcErr.unknown;
    }
  }

  @override
  Stream<RpcState<PingResult>> ping({
    Map<String, String> headers,
  }) async* {
    yield const RpcState<PingResult>.loading();
    try {
      final http.Response response = await _makeRequest(
        'Ping',
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<PingResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield const RpcState<PingResult>.unit();
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<PingResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  @override
  Stream<RpcState<StatusResult>> status({
    Map<String, String> headers,
  }) async* {
    yield const RpcState<StatusResult>.loading();
    try {
      final http.Response response = await _makeRequest(
        'Status',
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<StatusResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield RpcState<StatusResult>.ok(
          data: StatusResult.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<StatusResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  @override
  Stream<RpcState<VersionResult>> version({
    Map<String, String> headers,
  }) async* {
    yield const RpcState<VersionResult>.loading();
    try {
      final http.Response response = await _makeRequest(
        'Version',
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<VersionResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield RpcState<VersionResult>.ok(
          data: VersionResult.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<VersionResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  @override
  Stream<RpcState<GetUserResult>> getUser({
    @required int userID,
    Map<String, String> headers,
  }) async* {
    yield const RpcState<GetUserResult>.loading();
    try {
      final _GetUserArgs args = _GetUserArgs(
        userID: userID,
      );

      final http.Response response = await _makeRequest(
        'GetUser',
        json: args.toJson(),
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<GetUserResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield RpcState<GetUserResult>.ok(
          data: GetUserResult.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<GetUserResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  @override
  Stream<RpcState<UpdateNameResult>> updateName({
    @required int id,
    @required String username,
    Map<String, String> headers,
  }) async* {
    yield const RpcState<UpdateNameResult>.loading();
    try {
      final _UpdateNameArgs args = _UpdateNameArgs(
        id: id,
        username: username,
      );

      final http.Response response = await _makeRequest(
        'UpdateName',
        json: args.toJson(),
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<UpdateNameResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield RpcState<UpdateNameResult>.ok(
          data: UpdateNameResult.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<UpdateNameResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  @override
  Stream<RpcState<FindUserByIdResult>> findUserById({
    @required SearchFilter s,
    Map<String, String> headers,
  }) async* {
    yield const RpcState<FindUserByIdResult>.loading();
    try {
      final _FindUserByIdArgs args = _FindUserByIdArgs(
        s: s,
      );

      final http.Response response = await _makeRequest(
        'FindUserById',
        json: args.toJson(),
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<FindUserByIdResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield RpcState<FindUserByIdResult>.ok(
          data: FindUserByIdResult.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<FindUserByIdResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  @override
  Stream<RpcState<AddUserResult>> addUser({
    @required User user,
    Map<String, String> headers,
  }) async* {
    yield const RpcState<AddUserResult>.loading();
    try {
      final _AddUserArgs args = _AddUserArgs(
        user: user,
      );

      final http.Response response = await _makeRequest(
        'AddUser',
        json: args.toJson(),
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<AddUserResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield RpcState<AddUserResult>.ok(
          data: AddUserResult.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<AddUserResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  @override
  Stream<RpcState<ListUsersResult>> listUsers({
    Map<String, String> headers,
  }) async* {
    yield const RpcState<ListUsersResult>.loading();
    try {
      final http.Response response = await _makeRequest(
        'ListUsers',
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<ListUsersResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield RpcState<ListUsersResult>.ok(
          data: ListUsersResult.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<ListUsersResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }

  @override
  Stream<RpcState<DeleteUserResult>> deleteUser({
    @required int id,
    Map<String, String> headers,
  }) async* {
    yield const RpcState<DeleteUserResult>.loading();
    try {
      final _DeleteUserArgs args = _DeleteUserArgs(
        id: id,
      );

      final http.Response response = await _makeRequest(
        'DeleteUser',
        json: args.toJson(),
        headers: headers,
      );

      if (!_nonErrorcodes.contains(response.statusCode)) {
        final _RpcErr err = _getErr(response);
        yield RpcState<DeleteUserResult>.err(
          reason: err.message,
          statusCode: err.httpErr.code,
        );
      } else {
        yield RpcState<DeleteUserResult>.ok(
          data: DeleteUserResult.fromJson(
            jsonDecode(
              response.body,
            ),
          ),
        );
      }
    } on Exception catch (e, stackTrace) {
      yield RpcState<DeleteUserResult>.err(
        statusCode: 400,
        reason: e.toString(),
        stackTrace: stackTrace.toString(),
      );
    }
  }
}

// *********************************************************************
// WEBRPC-DART HELPER CODE.
// *********************************************************************

String _removeSlash(String host) => host.endsWith('/')
    ? host.replaceRange(host.length - 1, host.length, '')
    : host;

const Set<int> _nonErrorcodes = {
  200,
  201,
  202,
  203,
  204,
  205,
  206,
  300,
  301,
  302,
  303,
  304,
  307,
  308,
};

// An http error.
class _HttpErr {
  final String status;
  final int code;
  const _HttpErr(this.status, this.code);

  Map<String, dynamic> toMap() => {'status': status, 'code': code};
  String toJson() => jsonEncode(toMap());
  static _HttpErr fromMap(Map<String, dynamic> map) =>
      _HttpErr(map['status'] as String, map['code'] as int);

  static _HttpErr fromJson(dynamic json) => fromMap(
        jsonDecode(json),
      );
}

// An error created by the rpc server.
class _RpcErr {
  final String message;
  final String path;
  final DateTime time;
  final _HttpErr httpErr;
  const _RpcErr({this.message, this.path, this.httpErr, this.time});
  static const _RpcErr unknown = _RpcErr(
      message: 'an unknown error has occured',
      path: 'unknown',
      httpErr: _HttpErr('unknown', 400),
      time: null);
  Map<String, dynamic> toMap() => {
        'message': message,
        'path': path,
        'httpErr': httpErr.toMap(),
        'time-stamp': time.toString()
      };
  String toJson() => jsonEncode(toMap());
  static _RpcErr fromMap(Map<String, dynamic> map) => _RpcErr(
        message: map['message'] as String,
        path: map['path'] as String,
        time: DateTime.parse(
          map['time-stamp'],
        ),
        httpErr: _HttpErr.fromMap(
          map['httpErr'],
        ),
      );
  static _RpcErr fromJson(dynamic json) => fromMap(
        jsonDecode(json),
      );
}
