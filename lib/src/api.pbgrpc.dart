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
  static final _$getRequestToApprovalStream = $grpc.ClientMethod<
          $0.RequestToApprovalRequests, $0.RequestToApprovalResponse>(
      '/ValidatorApi.Transfers/GetRequestToApprovalStream',
      ($0.RequestToApprovalRequests value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RequestToApprovalResponse.fromBuffer(value));
  static final _$getRequestToApproval = $grpc.ClientMethod<
          $0.RequestToApprovalRequests, $0.RequestToApprovalResponse>(
      '/ValidatorApi.Transfers/GetRequestToApproval',
      ($0.RequestToApprovalRequests value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.RequestToApprovalResponse.fromBuffer(value));
  static final _$resolveRequestToApproval = $grpc.ClientMethod<
          $0.ResolveRequestToApprovalRequest,
          $0.ResolveRequestToApprovalResponse>(
      '/ValidatorApi.Transfers/ResolveRequestToApproval',
      ($0.ResolveRequestToApprovalRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ResolveRequestToApprovalResponse.fromBuffer(value));

  TransfersClient($grpc.ClientChannel channel, {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseStream<$0.RequestToApprovalResponse> getRequestToApprovalStream(
      $0.RequestToApprovalRequests request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getRequestToApprovalStream, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseStream(call);
  }

  $grpc.ResponseFuture<$0.RequestToApprovalResponse> getRequestToApproval(
      $0.RequestToApprovalRequests request,
      {$grpc.CallOptions options}) {
    final call = $createCall(
        _$getRequestToApproval, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }

  $grpc.ResponseFuture<$0.ResolveRequestToApprovalResponse>
      resolveRequestToApproval($0.ResolveRequestToApprovalRequest request,
          {$grpc.CallOptions options}) {
    final call = $createCall(
        _$resolveRequestToApproval, $async.Stream.fromIterable([request]),
        options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class TransfersServiceBase extends $grpc.Service {
  $core.String get $name => 'ValidatorApi.Transfers';

  TransfersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.RequestToApprovalRequests,
            $0.RequestToApprovalResponse>(
        'GetRequestToApprovalStream',
        getRequestToApprovalStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.RequestToApprovalRequests.fromBuffer(value),
        ($0.RequestToApprovalResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RequestToApprovalRequests,
            $0.RequestToApprovalResponse>(
        'GetRequestToApproval',
        getRequestToApproval_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.RequestToApprovalRequests.fromBuffer(value),
        ($0.RequestToApprovalResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ResolveRequestToApprovalRequest,
            $0.ResolveRequestToApprovalResponse>(
        'ResolveRequestToApproval',
        resolveRequestToApproval_Pre,
        false,
        false,
        ($core.List<$core.int> value) =>
            $0.ResolveRequestToApprovalRequest.fromBuffer(value),
        ($0.ResolveRequestToApprovalResponse value) => value.writeToBuffer()));
  }

  $async.Stream<$0.RequestToApprovalResponse> getRequestToApprovalStream_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RequestToApprovalRequests> request) async* {
    yield* getRequestToApprovalStream(call, await request);
  }

  $async.Future<$0.RequestToApprovalResponse> getRequestToApproval_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.RequestToApprovalRequests> request) async {
    return getRequestToApproval(call, await request);
  }

  $async.Future<$0.ResolveRequestToApprovalResponse>
      resolveRequestToApproval_Pre($grpc.ServiceCall call,
          $async.Future<$0.ResolveRequestToApprovalRequest> request) async {
    return resolveRequestToApproval(call, await request);
  }

  $async.Stream<$0.RequestToApprovalResponse> getRequestToApprovalStream(
      $grpc.ServiceCall call, $0.RequestToApprovalRequests request);
  $async.Future<$0.RequestToApprovalResponse> getRequestToApproval(
      $grpc.ServiceCall call, $0.RequestToApprovalRequests request);
  $async.Future<$0.ResolveRequestToApprovalResponse> resolveRequestToApproval(
      $grpc.ServiceCall call, $0.ResolveRequestToApprovalRequest request);
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
