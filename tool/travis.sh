#!/bin/bash

# Copyright (c) 2014, Google Inc. Please see the AUTHORS file for details.
# All rights reserved. Use of this source code is governed by a BSD-style
# license that can be found in the LICENSE file.

# Fast fail the script on failures.
set -e

# Get the Dart SDK (only for travis-ci.org; otherwise, assume that Dart is already available).
if [ "$TRAVIS" = "true" ]; then
  DART_DIST=dartsdk-linux-x64-release.zip
  curl http://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/$DART_DIST > $DART_DIST
  unzip $DART_DIST > /dev/null
  rm $DART_DIST
  export DART_SDK="$PWD/dart-sdk"
  export PATH="$DART_SDK/bin:$PATH"
fi

# Display installed versions.
dart --version

export PATH="$PATH":"~/.pub-cache/bin"

# Get our packages.
pub get

# Verify that the libraries are error free.
dartanalyzer lib/igdb_wrapper.dart
