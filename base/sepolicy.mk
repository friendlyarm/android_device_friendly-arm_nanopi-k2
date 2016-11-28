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

BOARD_SEPOLICY_DIRS := \
    device/friendly-arm/nanopi-k2/sepolicy

BOARD_SEPOLICY_REPLACE := \
    domain.te

BOARD_SEPOLICY_UNION := \
    device.te \
    file.te \
    file_contexts \
    genfs_contexts \
    boardinit.te \
    gpsd.te \
    imageserver.te \
    init.te \
    kernel.te \
    recovery.te \
    mediaserver.te \
    netd.te \
    property_contexts \
    property.te \
    ppp.te \
    remotecfg.te \
    service.te \
    service_contexts \
    servicemanager.te \
    system_app.te \
    system_control.te \
    system_server.te \
    unlabeled.te \
    vold.te \
    vold_ext.te \
    pppd.te \
    pppoe_wrapper.te \
    rild.te \
    modem_dongle_d.te \
    wlan_fwloader.te \
    zygote.te \
    surfaceflinger.te \
    zygote_proxy.te \
    bootanim.te \
    bootvideo.te \
    platform_app.te \
    instaboot.te \
    tvserver.te \
    tvcp.te \
    param.te \
    app.te \
    installd.te \
    lmkd.te \
    usbpm.te \
    seapp_contexts \
    hdcp_tx22.te

