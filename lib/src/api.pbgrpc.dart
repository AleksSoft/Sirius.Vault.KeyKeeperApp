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
  }

  $async.Future<$0.AcceptResponse> accept_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AcceptRequest> request) async {
    return accept(call, await request);
  }

  $async.Future<$0.PingResponse> getPing_Pre(
      $grpc.ServiceCall call, $async.Future<$0.PingRequest> request) async {
    return getPing(call, await request);
  }

  $async.Future<$0.AcceptResponse> accept(
      $grpc.ServiceCall call, $0.AcceptRequest request);
  $async.Future<$0.PingResponse> getPing(
      $grpc.ServiceCall call, $0.PingRequest request);
}
