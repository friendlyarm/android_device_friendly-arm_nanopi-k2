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

ifneq ($(wildcard vendor/amlogic/frameworks/av/LibPlayer),)
    WITH_LIBPLAYER_MODULE := true
else
    WITH_LIBPLAYER_MODULE := false
endif

# set soft stagefright extractor&decoder as defaults
WITH_SOFT_AM_EXTRACTOR_DECODER := true

PRODUCT_BOOT_JARS += \
    droidlogic \
    droidlogic.frameworks.pppoe

PRODUCT_PACKAGES += \
    droidlogic \
    droidlogic-res \
    systemcontrol \
    systemcontrol_static \
    PromptUser

PRODUCT_PACKAGES += \
    libsrec_jni \
    SpeechRecorder

# GLES and HAL modules
PRODUCT_PACKAGES += \
    libGLES_mali \
    gralloc.$(BOARD_HAL_NAME) \
    hwcomposer.$(BOARD_HAL_NAME) \
    power.$(BOARD_HAL_NAME) \
    memtrack.$(BOARD_HAL_NAME) \
    screen_source.$(BOARD_HAL_NAME)

# The OpenGL ES API level that is natively supported by this device.
# This is a 16.16 fixed point number
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    camera.disable_zsl_mode=1

# filesystem tools
PRODUCT_PACKAGES += \
    setup_fs \
    e2fsck \
    mkfs.exfat \
    mount.exfat \
    fsck.exfat \
    ntfs-3g \
    ntfsfix \
    mkntfs

# Connectivity
PRODUCT_PACKAGES += \
    libwifi-hal \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \

# glscaler and 3d format api
PRODUCT_PACKAGES += \
    libdisplaysetting

# native image player surface overlay so
PRODUCT_PACKAGES += \
    libsurfaceoverlay_jni

# native gif decode so
PRODUCT_PACKAGES += \
    libgifdecode_jni

# libstagefrighthw
PRODUCT_PACKAGES += \
    libomx_av_core_alt \
    libOmxCore \
    libOmxVideo \
    libthreadworker_alt \
    libdatachunkqueue_alt \
    libOmxBase \
    libomx_framework_alt \
    libomx_worker_peer_alt \
    libfpscalculator_alt \
    libomx_clock_utils_alt \
    libomx_timed_task_queue_alt \
    libstagefrighthw \
    libsecmem \
    secmem \
    2c1a33c0-44cc-11e5-bc3b0002a5d5c51b

# App optimization
PRODUCT_COPY_FILES += \
    $(PRIV_DEVICE_PATH)/optimization/liboptimization_32.so:system/lib/liboptimization.so \
    $(PRIV_DEVICE_PATH)/optimization/config:system/package_config/config

ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
PRODUCT_COPY_FILES += \
    $(PRIV_DEVICE_PATH)/optimization/liboptimization_64.so:system/lib64/liboptimization.so
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.app.optimization=true

