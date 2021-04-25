LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libaptX_encoder.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/
LOCAL_MULTILIB := 64
# Bypass prebuilt ELF check because libLLVM is not a module (it is copied by
# PRODUCT_COPY_FILES instead).
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := libaptXHD_encoder.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm64 := lib64/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/
LOCAL_MULTILIB := 64
# Bypass prebuilt ELF check because libLLVM is not a module (it is copied by
# PRODUCT_COPY_FILES instead).
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

