LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.wifi-service-lazy.mt6768.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_VENDOR_ETC)/init
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

LOCAL_PATH := hardware/interfaces/wifi/aidl/default

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.wifi-service-lazy.mt6768
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_PROPRIETARY_MODULE := true
LOCAL_CPPFLAGS := -Wall -Werror -Wextra
LOCAL_CFLAGS := -DLAZY_SERVICE
LOCAL_C_INCLUDES := frameworks/opt/net/wifi/libwifi_hal/include
LOCAL_HEADER_LIBRARIES := libhardware_legacy_headers
LOCAL_VINTF_FRAGMENTS := android.hardware.wifi-service.xml

LOCAL_REQUIRED_MODULES := \
    android.hardware.wifi-service-lazy.mt6768.rc

LOCAL_SRC_FILES := \
    service.cpp

LOCAL_SHARED_LIBRARIES := \
    libbase \
    libbinder_ndk \
    libcutils \
    liblog \
    libnl \
    libutils \
    libwifi-hal-mtk \
    libwifi-system-iface \
    libxml2 \
    android.hardware.wifi-V1-ndk

LOCAL_STATIC_LIBRARIES := android.hardware.wifi-service-lib

include $(BUILD_EXECUTABLE)
