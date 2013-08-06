LOCAL_PATH := $(call my-dir)

common_cflags := \
	-DANDROID \
	-DHAVE_CONFIG_H

LIBUSB_PATH := $(LOCAL_PATH)/../libusb

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/src \
	$(PCSC_PATH)/src/PCSC \
	$(LIBUSB_PATH) \

LOCAL_SRC_FILES:= \
	src/ccid.c \
        src/commands.c \
        src/ifdhandler.c \
        src/utils.c \
        src/ccid_usb.c \
        src/towitoko/atr.c \
        src/towitoko/pps.c \
        src/openct/buffer.c \
        src/openct/checksum.c \
        src/openct/proto-t1.c \
        src/tokenparser.c \
        src/strlcpy.c \
        src/simclist.c \
        src/debug.c

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/

LOCAL_MODULE_TAGS = eng
LOCAL_MODULE:= libccid
LOCAL_LDLIBS := -llog -ldl -lc
LOCAL_SHARED_LIBRARIES := libusb
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)


$(call import-module,libusb)
