# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2018 The LineageOS Project
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

include device/hardkernel/common/BoardConfig.mk

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/hardkernel/common/device.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

PRODUCT_NAME := lineage_odroidgo3
PRODUCT_DEVICE := odroidgo3
PRODUCT_MANUFACTURER := HardKernel Co., Ltd.
PRODUCT_BRAND := ODROID
PRODUCT_MODEL := LineageOS for Odroid GoS


PRODUCT_GMS_CLIENTID_BASE := android-rockchip

PRODUCT_BUILD_PROP_OVERRIDES += \
	TARGET_DEVICE="odroidgo3" \
	PRODUCT_NAME="odroidgo3" \
        PRIVATE_BUILD_DESC="ryu-user 8.1.0 OPM1.171019.016 4503492 release-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := "google/ryu/dragon:8.1.0/OPM1.171019.016/4503492:user/release-keys"

TARGET_VENDOR := rockchip
