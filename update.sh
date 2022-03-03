#!/usr/bin/env bash

#  Copyright 2022 Ahmed Charles <me@ahmedcharles.com>
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

set -x
set -euo pipefail
IFS=$'\n\r'

rm -rf src
mkdir src
svd2rust --target riscv -i ch32v30x.svd
form -i lib.rs -o src
rm lib.rs device.x
git checkout -- build.rs
cargo fmt
