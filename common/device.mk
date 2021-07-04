# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2019 The LineageOS Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Device was launched with M
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_m.mk)

# Enable Scoped Storage related
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Enable userspace reboot
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_mini_tablet_wifionly.mk)

# Vendor security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES := \
    	ro.carrier=wifi-only


# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := normal ldpi mdpi

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    	device/anbernic/common/overlay \
    	device/anbernic/common/overlay-lineage

# Soong namespaces
PRODUCT_SOONG_NAMESPACES := device/anbernic/common 

# 4 apps in the background
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.max_starting_bg=4 

PRODUCT_PROPERTY_OVERRIDES += \
    	dalvik.vm.heapstartsize=8m \
    	dalvik.vm.heaptargetutilization=0.75 \
    	dalvik.vm.heapminfree=512k \
    	dalvik.vm.heapmaxfree=2m \
    	dalvik.vm.heapgrowthlimit=128m \
    	dalvik.vm.heapsize=256m

# Reduces GC frequency of foreground apps by 50%
PRODUCT_PROPERTY_OVERRIDES += \
    	dalvik.vm.foreground-heap-growth-multiplier=2.0

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/fstab.rk30board:$(TARGET_COPY_OUT_RAMDISK)/fstab.rk30board \
    	$(LOCAL_PATH)/fstab.rk30board:$(TARGET_COPY_OUT_ROOT)/fstab.rk30board \
    	$(LOCAL_PATH)/fstab.rk30board:$(TARGET_COPY_OUT_VENDOR)/fstab.rk30board 
    	
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/init.rk30board.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.rk30board.rc \
    	$(LOCAL_PATH)/init.rk30board.rc:$(TARGET_COPY_OUT_ROOT)/init.rk30board.rc

# RTL BLUETOOTH
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/firmware/rtl_bt/rtl8723b_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8723b_config.bin \
    	$(LOCAL_PATH)/firmware/rtl_bt/rtl8723b_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8723b_fw.bin \
    	$(LOCAL_PATH)/firmware/rtl_bt/rtl8761a_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8761a_config.bin \
    	$(LOCAL_PATH)/firmware/rtl_bt/rtl8761a_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8761a_fw.bin \
	$(LOCAL_PATH)/firmware/rtl_bt/rtl8761b_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8761b_config.bin \
    	$(LOCAL_PATH)/firmware/rtl_bt/rtl8761b_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8761b_fw.bin \
    	$(LOCAL_PATH)/firmware/rtl_bt/rtl8821a_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8821a_config.bin \
    	$(LOCAL_PATH)/firmware/rtl_bt/rtl8821a_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8821a_fw.bin \
    	$(LOCAL_PATH)/firmware/rtl_bt/rtl8821c_config:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8821c_config.bin \
     	$(LOCAL_PATH)/firmware/rtl_bt/rtl8821c_fw:$(TARGET_COPY_OUT_VENDOR)/firmware/rtl_bt/rtl8821c_fw.bin \

# Mediatek Wifi
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/firmware/mediatek/mt7601u.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt7601u.bin \
    	$(LOCAL_PATH)/firmware/mediatek/mt7610e.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mediatek/mt7610e.bin \
    	$(LOCAL_PATH)/firmware/mediatek/mt7610u.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mediatek/mt7610u.bin \
    	$(LOCAL_PATH)/firmware/mediatek/mt7650.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt7650.bin \
	$(LOCAL_PATH)/firmware/mediatek/mt7662.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt7662.bin \
    	$(LOCAL_PATH)/firmware/mediatek/mt7662_rom_patch.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mt7662_rom_patch.bin \
    	$(LOCAL_PATH)/firmware/mediatek/mt7662u.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mediatek/mt7662u.bin \
    	$(LOCAL_PATH)/firmware/mediatek/mt7662u_rom_patch.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/mediatek/mt7662u_rom_patch.bin 

# Ralink Wifi
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/firmware/ralink/rt73.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rt73.bin \
    	$(LOCAL_PATH)/firmware/ralink/rt2561.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rt2561.bin \
    	$(LOCAL_PATH)/firmware/ralink/rt2561s.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rt2561s.bin \
    	$(LOCAL_PATH)/firmware/ralink/rt2661.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rt2661.bin \
	$(LOCAL_PATH)/firmware/ralink/rt2860.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rt2860.bin \
    	$(LOCAL_PATH)/firmware/ralink/rt2870.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rt2870.bin \
    	$(LOCAL_PATH)/firmware/ralink/rt3071.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rt3071.bin \
    	$(LOCAL_PATH)/firmware/ralink/rt3290.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/rt3290.bin

	    	    	    	    	    	
PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/ueventd.rk30board.rc:$(TARGET_COPY_OUT_ROOT)/ueventd.rk30board.rc \
    	
# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/handheld_core_hardware.xml \
    	frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml \
        frameworks/native/data/etc/android.software.cts.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.cts.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    	frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.autofill.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.autofill.xml \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.gamepad.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.gamepad.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
        frameworks/native/data/etc/android.hardware.faketouch.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.faketouch.xml \
        frameworks/native/data/etc/android.software.backup.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.backup.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    	frameworks/native/data/etc/android.hardware.ethernet.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.software.freeform_window_management.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.freeform_window_management.xml \
	frameworks/native/data/etc/android.software.picture_in_picture.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.picture_in_picture.xml \

PRODUCT_COPY_FILES += \
    	$(LOCAL_PATH)/bluetooth/bd_addr.txt:$(TARGET_COPY_OUT_VENDOR)/etc/bt/bd_addr.txt \
    	$(LOCAL_PATH)/configs/media/external_camera_config.xml:$(TARGET_COPY_OUT_VENDOR)/etc/external_camera_config.xml \
    	$(LOCAL_PATH)/configs/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml \
    	$(LOCAL_PATH)/configs/media/media_codecs_performance_rk3326.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    	$(LOCAL_PATH)/configs/media/media_codecs_rk3326.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \

# Copy media codecs config file
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    	$(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/audio_policy_configuration.xml \
    	$(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    	$(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio/audio_policy_configuration.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_telephony.xml \
	frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_c2.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_c2.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_c2_audio.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_c2_audio.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_c2_video.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/media_codecs_google_c2_video.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml

# Need AppWidget permission to prevent Launcher[2|3] crashing
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml

# Public libraries
#PRODUCT_COPY_FILES += \
#    $(LOCAL_PATH)/configs/public.libraries.txt:$(TARGET_COPY_OUT_VENDOR)/etc/public.libraries.txt

# audio policy configuration
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
    	frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
	frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
	frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml 

# Seccomp
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/seccomp/mediaswcodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediaswcodec.policy \
    	$(LOCAL_PATH)/configs/seccomp/mediacodec.policy:$(TARGET_COPY_OUT_VENDOR)/etc/seccomp_policy/mediacodec.policy

# Audio HIDL
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@6.0-impl \
    android.hardware.audio.effect@6.0-impl \
    
# Build default bluetooth a2dp and usb audio HALs
PRODUCT_PACKAGES += \
    	audio.primary.$(TARGET_BOARD_PLATFORM) \
	audio.usb.default \
    	audio.r_submix.default \
    	audio.hearing_aid.default \
    	libaudioroute \
    	libaudio-resampler \
    	tinyplay \
    	tinycap \
    	tinymix \
    	tinypcminfo
    
# Enable AAudio MMAP/NOIRQ data path.
# 1 is AAUDIO_POLICY_NEVER  means only use Legacy path.
# 2 is AAUDIO_POLICY_AUTO   means try MMAP then fallback to Legacy path.
# 3 is AAUDIO_POLICY_ALWAYS means only use MMAP path.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_policy=2
# 1 is AAUDIO_POLICY_NEVER  means only use SHARED mode
# 2 is AAUDIO_POLICY_AUTO   means try EXCLUSIVE then fallback to SHARED mode.
# 3 is AAUDIO_POLICY_ALWAYS means only use EXCLUSIVE mode.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_exclusive_policy=2
    
# Bluetooth HIDL
PRODUCT_PACKAGES += \
    	audio.bluetooth.default \
    	android.hardware.bluetooth.audio@2.0-impl \
    	android.hardware.bluetooth@1.1-impl \
    	android.hardware.bluetooth@1.1-service.btlinux

PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml 

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version.xml \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute.xml

# Specify OpenGLES version 
PRODUCT_PROPERTY_OVERRIDES += \
    	ro.opengles.version=196610

PRODUCT_PROPERTY_OVERRIDES += \
	ro.hardware.vulkan=rk30board \
    	
#binary blobs from ARM
#	vulkan.rk30board \

PRODUCT_PACKAGES += libGLES_mali.so 
PRODUCT_PACKAGES += libGLES_android

PRODUCT_PACKAGES += libwifi-hal-rtl

# Graphics HAL
# define MPP_BUF_TYPE_DRM 1
# define MPP_BUF_TYPE_ION_LEGACY 2
# define MPP_BUF_TYPE_ION_404 3
# define MPP_BUF_TYPE_ION_419 4
# define MPP_BUF_TYPE_DMA_BUF 5
ifeq ($(TARGET_RK_GRALLOC_VERSION),4)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.mpp_buf_type=1
# Gralloc HAL
PRODUCT_PACKAGES += \
    arm.graphics-V1-ndk_platform.so \
    android.hardware.graphics.allocator@4.0-impl-$(BOARD_VENDOR_GPU_PLATFORM) \
    android.hardware.graphics.mapper@4.0-impl-$(BOARD_VENDOR_GPU_PLATFORM) \
    android.hardware.graphics.allocator@4.0-service

DEVICE_MANIFEST_FILE += \
    device/anbernic/common/manifests/android.hardware.graphics.mapper@4.0.xml \
    device/anbernic/common/manifests/android.hardware.graphics.allocator@4.0.xml
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.mpp_buf_type=1
PRODUCT_PACKAGES += \
    gralloc.$(TARGET_BOARD_HARDWARE) \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service

DEVICE_MANIFEST_FILE += \
    device/anbernic/common/manifests/android.hardware.graphics.mapper@2.1.xml \
    device/anbernic/common/manifests/android.hardware.graphics.allocator@2.0.xml
endif

PRODUCT_PACKAGES += \
    rkhelper

# HW Composer
PRODUCT_PACKAGES += \
    hwcomposer.$(TARGET_BOARD_HARDWARE) \
    android.hardware.graphics.composer@2.1-service

# Software Gatekeeper HAL
PRODUCT_PACKAGES += \
    	android.hardware.gatekeeper@1.0-service.software

# Memtrack HAL
PRODUCT_PACKAGES += \
	memtrack.default \
	android.hardware.memtrack@1.0-impl \
	android.hardware.memtrack@1.0-service

# ThermalHAL
PRODUCT_PACKAGES += \
     	android.hardware.thermal@2.0-service.mock \

# DRM
PRODUCT_PACKAGES += \
    	android.hardware.drm@1.0-impl \
    	android.hardware.drm@1.0-service-lazy \
    	android.hardware.drm@1.3-service-lazy.clearkey \
        android.hardware.drm@1.3-service-lazy.widevine

# Dumpstate HAL
PRODUCT_PACKAGES += \
    	android.hardware.dumpstate@1.0-impl \
    	android.hardware.dumpstate@1.0-service

PRODUCT_PACKAGES += \
    	android.hardware.keymaster@3.0-impl \
    	android.hardware.keymaster@3.0-service

# Light HIDL
PRODUCT_PACKAGES += \
    	lights.$(TARGET_BOARD_PLATFORM) \
    	android.hardware.light@2.0-service \
    	android.hardware.light@2.0-impl

# Media HIDL
PRODUCT_PACKAGES += \
    	android.hardware.media.omx@1.0-service \
	android.hardware.media.c2@1.0-service
	
# PowerHAL
PRODUCT_PACKAGES += \
    	power.default \
    	android.hardware.power@1.0-impl \
    	android.hardware.power@1.0-service

# RenderScript HIDL
PRODUCT_PACKAGES += \
    	android.hardware.renderscript@1.0-impl

# Health
PRODUCT_PACKAGES += \
	android.hardware.health@2.1-impl \
	android.hardware.health@2.1-service

# USB HIDL
PRODUCT_PACKAGES += \
        android.hardware.usb@1.1-service

#PRODUCT_COPY_FILES += \
#    hardware/rockchip/libgraphicpolicy/graphic_profiles.conf:$(TARGET_COPY_OUT_VENDOR)/etc/graphic/graphic_profiles.conf

# Wi-Fi   
PRODUCT_PACKAGES += \
    android.hardware.wifi.hostapd@1.0-service \
    android.hardware.wifi@1.0-service \

# Add wifi-related packages
PRODUCT_PACKAGES += libwpa_client wpa_supplicant hostapd wificond libwifi-hal
PRODUCT_PROPERTY_OVERRIDES += wifi.interface=wlan0 \
                              wifi.supplicant_scan_interval=180
                              
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant.conf \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/rt2870.bin:$(TARGET_COPY_OUT_ROOT)/lib/firmware/rt2870.bin \
    $(LOCAL_PATH)/configs/wifi/rtl8192cufw_TMSC.bin:$(TARGET_COPY_OUT_ROOT)/lib/firmware/rtlwifi/rtl8192cufw_TMSC.bin \
    $(LOCAL_PATH)/configs/wifi/wifi_id_list.txt:$(TARGET_COPY_OUT_VENDOR)/etc/wifi_id_list.txt \
    $(LOCAL_PATH)/configs/wifi/8192cu:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/8192cu \
    $(LOCAL_PATH)/configs/wifi/8812au:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/8812au \
    $(LOCAL_PATH)/configs/wifi/8814au:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/8814au \
    $(LOCAL_PATH)/configs/wifi/88x2bu:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/88x2bu \
    $(LOCAL_PATH)/configs/wifi/8821au:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/8821au \
    $(LOCAL_PATH)/configs/wifi/8821cu:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/8821cu \
    $(LOCAL_PATH)/configs/wifi/rt2800usb:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/rt2800usb \
    $(LOCAL_PATH)/configs/wifi/mt7610:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/mt7610 \
    $(LOCAL_PATH)/configs/wifi/mt7601:$(TARGET_COPY_OUT_VENDOR)/etc/modprobe.d/mt7601 \
    $(LOCAL_PATH)/configs/wifi/RT2870STA.dat:$(TARGET_COPY_OUT_SYSTEM)/etc/Wireless/RT2870STA/RT2870STA.dat
	    
# Copy device kcm
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/Vendor_1209_Product_3100.kcm:$(TARGET_COPY_OUT_VENDOR)/usr/keychars/Vendor_1209_Product_3100.kcm 

# Build and run only ART
PRODUCT_RUNTIMES := runtime_libart_default

PRODUCT_PRODUCT_PROPERTIES += \
	ro.statsd.enable=false

# Remove phone packages that added by default product configuration
PRODUCT_PACKAGES += \
    	remove-BlockedNumberProvider \
    	remove-Telecom \
    	remove-TeleService \
    	remove-MmsService \
	remove-Traceur \
	remove-HTMLViewer \
	remove-UserDictionaryProvider \
	remove-SimAppDialog \
	remove-SoundPicker \
	remove-SecureElement \
	remove-EasterEgg \
	remove-CalendarProvider \
	remove-BookmarkProvider \
	remove-BasicDreams \
	remove-LatinIME \
	remove-DeskClock \
	remove-Contacts \
	remove-Calendar \
    	remove-ExactCalculator \
    	remove-Etar \
    	remove-Email \
 	
PRODUCT_PACKAGES += \
	usb_modeswitch \
	ATVLauncher \
	TVbro \
	LeanbackIME \

# Exclude AudioFX
TARGET_EXCLUDES_AUDIOFX := true

# Netutils
PRODUCT_PACKAGES += \
	android.system.net.netd@1.0 \
	libandroid_net \
	netutils-wrapper-1.0

# Trust
PRODUCT_PACKAGES += \
	vendor.lineage.trust@1.0-service

# WiFi Display
PRODUCT_PACKAGES += \
	libaacwrapper \
	libnl \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
	ro.surface_flinger.start_graphics_allocator_service=1 \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.logd.auditd=false \
	ro.logd.kernel=false \

#PRODUCT_PROPERTY_OVERRIDES += \
#	ro.logd.size=1M \
#	logd.logpersistd=logcatd \
#	logd.logpersistd.size=30 \

#    
#      debug.stagefright.ccodec=0

#PRODUCT_PROPERTY_OVERRIDES += \
#	ro.lmk.use_psi=true	\


PRODUCT_PROPERTY_OVERRIDES += \
	persist.debug.wfd.enable=1 \
	debug.hwui.renderer=skiagl \
	debug.hwui.use_buffer_age=false \
	debug.hwui.use_partial_updates=false \
	debug.sf.disable_backpressure=1 \
	debug.sf.enable_gl_backpressure=1 \
	vendor.hwc.compose_policy=6 \
	vendor.hwc.device.primary=DSI \
	ro.config.media_vol_steps=12 \
	vendor.gralloc.no_afbc_for_fb_target_layer = 1 \

# librkskia
PRODUCT_PACKAGES += \
	librkskia \

	
# omx
PRODUCT_PACKAGES += \
    	libomxvpu_enc \
    	libomxvpu_dec \
    	libRkOMX_Resourcemanager \
    	libRkOMX_Basecomponent \
    	libRkOMX_OSAL \
    	libOMX_Core \

# Camera omx-plugin vpu akmd libion_rockchip_ext
#    	
PRODUCT_PACKAGES += \
    	libvpu \
    	libstagefrighthw \
    	libstagefright_wfd \
    	libgralloc_priv_omx \
    	libion \
    	akmd \
    	libion_ext \

# libvpu
PRODUCT_PACKAGES += \
    libffmpeg_58 \
    libiconv \
    libjpeghwenc \
    libmpp \
    librk_vpuapi \
    librtopus \

PRODUCT_PROPERTY_OVERRIDES += \
	config.disable_rtt=true \
	config.disable_bluetooth=false \
	config.disable_vrmanager=true \
	config.disable_consumerir=true \
	config.disable_cameraservice=true \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.radio.noril=yes \
	ro.lockscreen.disable.default=true \
	persist.adb.tcp.port=5037 \
	persist.sys.zram_enabled=1 \
	persist.sys.disable_rescue=true \
	persist.sys.purgeable_assets=1 \
	ro.kernel.android.checkjni=0 \
	debug.sf.nobootanimation=0
	
# Disable stats logging & monitoring
PRODUCT_PROPERTY_OVERRIDES += \
	debug.atrace.tags.enableflags=0 \
	debugtool.anrhistory=0 \
	ro.com.google.locationfeatures=0 \
	ro.com.google.networklocation=0 \
	profiler.debugmonitor=false \
	profiler.launch=false \
	profiler.hung.dumpdobugreport=false \
	persist.service.pcsync.enable=0 \
	persist.service.lgospd.enable=0 \

# Disable Scudo outside of eng builds to save RAM.
PRODUCT_DISABLE_SCUDO := true
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Set lowram options and enable traced by default
PRODUCT_VENDOR_PROPERTIES += \
     ro.config.low_ram=true \

# Speed profile services and wifi-service to reduce RAM and storage.
PRODUCT_SYSTEM_SERVER_COMPILER_FILTER := speed-profile

# Always preopt extracted APKs to prevent extracting out of the APK for gms
# modules.
PRODUCT_ALWAYS_PREOPT_EXTRACTED_APK := true

# Do not generate libartd.
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Flatten APEXs for performance
OVERRIDE_TARGET_FLATTEN_APEX := true

# IORap app launch prefetching using Perfetto traces and madvise
PRODUCT_PRODUCT_PROPERTIES += \
    ro.iorapd.enable=true

# set threshold to filter unused apps
PRODUCT_PROPERTY_OVERRIDES += \
pm.dexopt.downgrade_after_inactive_days=10

# Dedupe VNDK libraries with identical core variants.
TARGET_VNDK_USE_CORE_VARIANT := true

# madvise random in ART to reduce page cache thrashing.
dalvik.vm.madvise-random=true

PRODUCT_TYPE := go
$(call inherit-product-if-exists, vendor/gapps/gapps.mk)
