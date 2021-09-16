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

include device/anbernic/common/BoardConfig.mk

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/anbernic/common/device.mk)

# Inherit from device-specific part of the product configuration
$(call inherit-product, device/anbernic/rg351mplus/device.mk)

# Boot animation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 640

PRODUCT_NAME := lineage_rg351mplus
PRODUCT_DEVICE := rg351mplus
PRODUCT_MANUFACTURER := Anbernic
PRODUCT_BRAND := Anbernic
PRODUCT_MODEL := LineageOS for Anbernic rg351mplus


PRODUCT_GMS_CLIENTID_BASE := android-rockchip

PRODUCT_BUILD_PROP_OVERRIDES += \
	TARGET_DEVICE="rg351mplus" \
	PRODUCT_NAME="rg351mplus" \
	PRIVATE_BUILD_DESC="lineage_rg351mplus-userdebug 11 RP1A.201005.004 test-keys"

# Set BUILD_FINGERPRINT variable to be picked up by both system and vendor build.prop
BUILD_FINGERPRINT := google/ryu/dragon:8.1.0/OPM1.171019.016/4503492:user/release-keys

TARGET_VENDOR := rockchip
