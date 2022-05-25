///
//  Generated code. Do not modify.
//  source: nft/query.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'query.pb.dart' as $64;
import 'query.pbjson.dart';

export 'query.pb.dart';

abstract class QueryServiceBase extends $pb.GeneratedService {
  $async.Future<$64.QueryClassResponse> Class($pb.ServerContext ctx, $64.QueryClassRequest request);
  $async.Future<$64.QueryClassesResponse> classes($pb.ServerContext ctx, $64.QueryClassesRequest request);
  $async.Future<$64.QueryNFTResponse> nFT($pb.ServerContext ctx, $64.QueryNFTRequest request);
  $async.Future<$64.QueryNFTsResponse> nFTs($pb.ServerContext ctx, $64.QueryNFTsRequest request);
  $async.Future<$64.QuerySupplyResponse> supply($pb.ServerContext ctx, $64.QuerySupplyRequest request);
  $async.Future<$64.QueryOwnerResponse> owner($pb.ServerContext ctx, $64.QueryOwnerRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'Class': return $64.QueryClassRequest();
      case 'Classes': return $64.QueryClassesRequest();
      case 'NFT': return $64.QueryNFTRequest();
      case 'NFTs': return $64.QueryNFTsRequest();
      case 'Supply': return $64.QuerySupplyRequest();
      case 'Owner': return $64.QueryOwnerRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'Class': return this.Class(ctx, request as $64.QueryClassRequest);
      case 'Classes': return this.classes(ctx, request as $64.QueryClassesRequest);
      case 'NFT': return this.nFT(ctx, request as $64.QueryNFTRequest);
      case 'NFTs': return this.nFTs(ctx, request as $64.QueryNFTsRequest);
      case 'Supply': return this.supply(ctx, request as $64.QuerySupplyRequest);
      case 'Owner': return this.owner(ctx, request as $64.QueryOwnerRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => QueryServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => QueryServiceBase$messageJson;
}

