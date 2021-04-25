LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libGLES_mali.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm := lib/egl/$(LOCAL_MODULE)
LOCAL_SRC_FILES_arm64 := lib64/egl/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/egl/
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/egl/
LOCAL_MULTILIB := both
LOCAL_SHARED_LIBRARIES := android.hardware.graphics.common@1.0 libz libnativewindow libc++ liblog libm libc libdl libutilscallstack libcutils android.hardware.graphics.mapper@4.0 libgralloctypes libhidlbase libutils libz


# Create symlinks.
LOCAL_POST_INSTALL_CMD := \
	if [ -f $(LOCAL_MODULE_PATH_64)/libGLES_mali.so ];then cd $(TARGET_OUT_VENDOR)/lib64; ln -sf egl/libGLES_mali.so libGLES_mali.so; cd -; fi; \
	if [ $(BUILD_WITH_GOOGLE_MARKET) != true ];then mkdir -p $(TARGET_OUT_VENDOR)/lib64/hw; cd $(TARGET_OUT_VENDOR)/lib64/hw; ln -sf ../libGLES_mali.so vulkan.$(TARGET_BOARD_PLATFORM).so; cd -; fi; \
	cd $(TARGET_OUT_VENDOR)/lib64; \
	ln -sf egl/libGLES_mali.so libOpenCL.so.1.1; \
	ln -sf libOpenCL.so.1.1 libOpenCL.so.1; \
	ln -sf libOpenCL.so.1 libOpenCL.so; \
	cd -;

include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE := vulkan.rk3326.so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_STRIP_MODULE := false
LOCAL_SRC_FILES_arm := lib/hw/$(LOCAL_MODULE)
LOCAL_SRC_FILES_arm64 := lib64/hw/$(LOCAL_MODULE)
LOCAL_MODULE_PATH_32 := $(TARGET_OUT_VENDOR)/lib/hw
LOCAL_MODULE_PATH_64 := $(TARGET_OUT_VENDOR)/lib64/hw
LOCAL_MULTILIB := both
LOCAL_SHARED_LIBRARIES := android.hardware.graphics.common@1.0 libz libnativewindow libc++ liblog libm libc libdl
# Bypass prebuilt ELF check because the DT_SONAME "libGLES_mali.so" is
# different from LOCAL_MODULE "vulkan.hikey960.so".
LOCAL_CHECK_ELF_FILES := false
include $(BUILD_PREBUILT)

