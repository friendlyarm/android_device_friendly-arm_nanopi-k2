#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# PlayReady DRM
ifeq ($(BUILD_WITH_PLAYREADY_DRM),true)
    # playready license process in smoothstreaming(default)
    BOARD_PLAYREADY_LP_IN_SS := true
    #BOARD_PLAYREADY_TVP := true
endif

# Verimatrix DRM
BUILD_WITH_VIEWRIGHT_WEB := false
BUILD_WITH_VIEWRIGHT_STB := false

# DRM Widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

ifeq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),1)
    TARGET_USE_OPTEEOS := true
endif

