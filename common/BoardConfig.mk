# Primary Arch
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

# Secondary Arch
TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_2ND_CPU_VARIANT_RUNTIME :=  cortex-a53

TARGET_BOARD_HARDWARE := rk30board
TARGET_BOARD_PLATFORM := rk3326
TARGET_BOARD_PLATFORM_GPU := mali-tDVx
BOARD_VENDOR_GPU_PLATFORM := bifrost
TARGET_RK_GRALLOC_VERSION := 2

# DRM
BOARD_USE_DRM := true

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

# generic wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_nl80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_nl80211

WIFI_DRIVER             := rtl8812au
BOARD_WIFI_VENDOR       := realtek
BOARD_WLAN_DEVICE 	:= rtl8812au
WIFI_DRIVER_MODULE_PATH := /vendor/lib/modules/8812au.ko
WIFI_DRIVER_MODULE_NAME := 8812au
WIFI_DRIVER_MODULE_ARG  := "ifname=wlan0 if2name=p2p0"


# BT configs
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_LINUX := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/hardkernel/common/bluetooth

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
BUILD_EMULATOR := false

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_USES_RECOVERY_AS_BOOT := true

TARGET_KERNEL_SOURCE := kernel/kernel
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CONFIG := lineageos_odroidgo3_defconfig
TARGET_KERNEL_CLANG_COMPILE := true
BOARD_KERNEL_IMAGE_NAME = Image

#BOARD_KERNEL_PAGESIZE := 4096
#BOARD_KERNEL_BASE 	:= 0x10000000
#BOARD_KERNEL_OFFSET 	:= 0x00008000
#BOARD_RAMDISK_OFFSET 	:= 0x01000000
#BOARD_KERNEL_TAGS_OFFSET := 0x00000100


#TARGET_USES_UNCOMPRESSED_KERNEL := true
#BOARD_DTB_OFFSET 	:= 0x01f00000
#BOARD_KERNEL_CMDLINE 	:= root=/dev/mmcblk0p2 skip_initramfs rootfstype=ext4 rootwait init=/init fbcon=rotate:3 consoleblank=0
#TARGET_PREBUILT_KERNEL := device/hardkernel/common/kernel/Image
#TARGET_PREBUILT_DTB := device/hardkernel/odroidgo2/kernel/rk3326-odroidgo2-linux-v11.dtb
#BOARD_BOOTIMG_HEADER_VERSION := 1
#BOARD_HEADER_SIZE := 1580
#BOARD_RECOVERY_MKBOOTIMG_ARGS := --header_version 1
#BOARD_MKBOOTIMG_ARGS := --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
#BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)

BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := false

TARGET_USES_HWC2 		:= true
USE_OPENGL_RENDERER 		:= true
TARGET_SCREEN_DENSITY 		?= 120

# Vulkan
BOARD_INSTALL_VULKAN := true

BOARD_OVERRIDE_RS_CPU_VARIANT_32 := cortex-a35
BOARD_OVERRIDE_RS_CPU_VARIANT_64 := cortex-a35

# Camera
USE_CAMERA_STUB := false

BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_SYSTEMIMAGE_PARTITION_SIZE ?= 1849591808 # 2427M
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4

TARGET_COPY_OUT_VENDOR := vendor
BOARD_VENDORIMAGE_PARTITION_SIZE ?= 134217728 # 128M
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USERDATAIMAGE_PARTITION_SIZE ?= 134217728 # 128M
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Recovery
TARGET_NO_RECOVERY := false
TARGET_RECOVERY_FSTAB    := device/hardkernel/common/recovery.fstab
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := $(shell echo $$((200*1024*1024))) # 200M
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
TARGET_RECOVERY_DENSITY ?= mdpi
TARGET_RECOVERY_DEFAULT_ROTATION := ROTATION_LEFT
TARGET_RECOVERY_UI_SCREEN_WIDTH ?= 480

ifneq ($(TARGET_NO_RECOVERY),true)
PRODUCT_COPY_FILES += \
	device/hardkernel/common/init.recovery.common.rc:recovery/root/init.recovery.rk3326.rc
endif

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# HIDL
DEVICE_MANIFEST_FILE := device/hardkernel/common/manifest.xml
DEVICE_MATRIX_FILE := device/hardkernel/common/compatibility_matrix.xml

# Sepolicy
#BOARD_SEPOLICY_DIRS := $(DEVICE_PATH)/sepolicy
#SELINUX_IGNORE_NEVERALLOWS := true

#Config omx to support codec type.
BOARD_SUPPORT_VP9 := true
BOARD_SUPPORT_VP6 := true
BOARD_SUPPORT_HEVC := true
BOARD_SUPPORT_VP8_ENC := true
BOARD_SUPPORT_HEVC_ENC := true
ALLOW_MISSING_DEPENDENCIES=true
