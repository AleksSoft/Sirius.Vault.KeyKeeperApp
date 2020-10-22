#!/bin/bash

# pub global deactivate protoc_plugin
# pub global activate protoc_plugin

# run proto file generator
SRC_DIR=./assets/protos
DST_DIR=./lib/src/

protoc -I=$SRC_DIR --dart_out=grpc:$DST_DIR $SRC_DIR/*.proto

# run the same command for default google protos
# https://github.com/protocolbuffers/protobuf/tree/master/src/google/protobuf
G_SRC_DIR=$SRC_DIR/google
G_DST_DIR=$DST_DIR/google/protobuf

protoc -I=$G_SRC_DIR --dart_out=grpc:$G_DST_DIR $G_SRC_DIR/*.proto


# protoc -I=./assets/protos --dart_out=grpc:./lib/src/ ./assets/protos/*.proto
# protoc -I=./assets/protos --dart_out=grpc:./lib/src/google/protobuf ./assets/protos/google*.proto