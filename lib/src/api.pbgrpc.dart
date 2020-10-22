///
//  Generated code. Do not modify.
//  source: api.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'api.pb.dart' as $0;
export 'api.pb.dart';

class TransfersClient extends $grpc.Client {
  static final _$getApprovalRequests = $grpc.ClientMethod<
          $0.GetApprovalRequestsRequests, $0.GetApprovalRequestsResponse>(
      '/ValidatorApi.Transfers/GetApprovalRequests',
      ($0.GetApprovalRequestsRequests value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetApprovalRequestsResponse.fromBuffer(value));
  static final _$resolveApprovalRequests = $grpc.ClientMethod<
          $0.ResolveApprovalRequestsRequest,
          $0.ResolveApprovalRequestsResponse>(
      '/ValidatorApi.Transfers/ResolveApprovalRequests',
      ($0.ResolveApprovalRequestsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ResolveApprovalRequestsResponse.fromBuffer(value));

  TransfersClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.GetApprovalRequestsResponse> getApprovalRequests(
      $0.GetApprovalRequestsRequests request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getApprovalRequests, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ResolveApprovalRequestsResponse>
      resolveApprovalRequests($0.ResolveApprovalRequestsRequest request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$resolveApprovalRequests, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class TransfersServiceBase extends $grpc.Service {
  $core.String get $name => 'ValidatorApi.Transfers';

  TransfersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetApprovalRequestsRequests,
            $0.GetApprovalRequestsResponse>(
        'GetApprovalRequests',
        getApprovalRequests_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetApprovalRequestsRequests.fromBuffer(value),
        ($0.GetApprovalRequestsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResolveApprovalRequestsRequest,
            $0.ResolveApprovalRequestsResponse>(
        'ResolveApprovalRequests',
        resolveApprovalRequests_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResolveApprovalRequestsRequest.fromBuffer(value),
        ($0.ResolveApprovalRequestsResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetApprovalRequestsResponse> getApprovalRequests_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetApprovalRequestsRequests> request) async {
    return getApprovalRequests(call, await request);
  }

  $async.Future<$0.ResolveApprovalRequestsResponse> resolveApprovalRequests_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ResolveApprovalRequestsRequest> request) async {
    return resolveApprovalRequests(call, await request);
  }

  $async.Future<$0.GetApprovalRequestsResponse> getApprovalRequests(
      $grpc.ServiceCall call, $0.GetApprovalRequestsRequests request);
  $async.Future<$0.ResolveApprovalRequestsResponse> resolveApprovalRequests(
      $grpc.ServiceCall call, $0.ResolveApprovalRequestsRequest request);
}

class InvitesClient extends $grpc.Client {
  static final _$accept =
      $grpc.ClientMethod<$0.AcceptRequest, $0.AcceptResponse>(
          '/ValidatorApi.Invites/Accept',
          ($0.AcceptRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) => $0.AcceptResponse.fromBuffer(value));
  static final _$getPing = $grpc.ClientMethod<$0.PingRequest, $0.PingResponse>(
      '/ValidatorApi.Invites/GetPing',
      ($0.PingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PingResponse.fromBuffer(value));
  static final _$removeVaultConnection = $grpc.ClientMethod<
          $0.RemoveVaultConnectionRequest, $0.RemoveVaultConnectionResponse>(
      '/ValidatorApi.Invites/RemoveVaultConnection',
      ($0.RemoveVaultConnectionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RemoveVaultConnectionResponse.fromBuffer(value));

  InvitesClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.AcceptResponse> accept($0.AcceptRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$accept, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.PingResponse> getPing($0.PingRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$getPing, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.RemoveVaultConnectionResponse> removeVaultConnection(
      $0.RemoveVaultConnectionRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$removeVaultConnection, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class InvitesServiceBase extends $grpc.Service {
  $core.String get $name => 'ValidatorApi.Invites';

  InvitesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AcceptRequest, $0.AcceptResponse>(
        'Accept',
        accept_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AcceptRequest.fromBuffer(value),
        ($0.AcceptResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PingRequest, $0.PingResponse>(
        'GetPing',
        getPing_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PingRequest.fromBuffer(value),
        ($0.PingResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveVaultConnectionRequest,
            $0.RemoveVaultConnectionResponse>(
        'RemoveVaultConnection',
        removeVaultConnection_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RemoveVaultConnectionRequest.fromBuffer(value),
        ($0.RemoveVaultConnectionResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AcceptResponse> accept_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AcceptRequest> request) async {
    return accept(call, await request);
  }

  $async.Future<$0.PingResponse> getPing_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PingRequest> request) async {
    return getPing(call, await request);
  }

  $async.Future<$0.RemoveVaultConnectionResponse> removeVaultConnection_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RemoveVaultConnectionRequest> request) async {
    return removeVaultConnection(call, await request);
  }

  $async.Future<$0.AcceptResponse> accept(
      $grpc.ServiceCall call, $0.AcceptRequest request);
  $async.Future<$0.PingResponse> getPing(
      $grpc.ServiceCall call, $0.PingRequest request);
  $async.Future<$0.RemoveVaultConnectionResponse> removeVaultConnection(
      $grpc.ServiceCall call, $0.RemoveVaultConnectionRequest request);
}

class VersionClient extends $grpc.Client {
  static final _$getCurrentVersion = $grpc.ClientMethod<
          $0.GetCurrentVersionRequest, $0.GetCurrentVersionResponce>(
      '/ValidatorApi.Version/GetCurrentVersion',
      ($0.GetCurrentVersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.GetCurrentVersionResponce.fromBuffer(value));

  VersionClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.GetCurrentVersionResponce> getCurrentVersion(
      $0.GetCurrentVersionRequest request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getCurrentVersion, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class VersionServiceBase extends $grpc.Service {
  $core.String get $name => 'ValidatorApi.Version';

  VersionServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetCurrentVersionRequest,
            $0.GetCurrentVersionResponce>(
        'GetCurrentVersion',
        getCurrentVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.GetCurrentVersionRequest.fromBuffer(value),
        ($0.GetCurrentVersionResponce value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetCurrentVersionResponce> getCurrentVersion_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.GetCurrentVersionRequest> request) async {
    return getCurrentVersion(call, await request);
  }

  $async.Future<$0.GetCurrentVersionResponce> getCurrentVersion(
      $grpc.ServiceCall call, $0.GetCurrentVersionRequest request);
}
