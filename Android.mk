LOCAL_PATH := $(call my-dir)

common_cflags := \
	-DANDROID \
	-DPCSCD_PATH='"$(PCSCD_PATH)"' \
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

LOCAL_CFLAGS		:= $(common_cflags)

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/

LOCAL_MODULE_TAGS = eng
LOCAL_MODULE:= libccid
LOCAL_LDLIBS := -llog -ldl -lc
LOCAL_SHARED_LIBRARIES := libusb
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)


include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \

LOCAL_SRC_FILES:= \
        examples/scardcontrol.c \

LOCAL_CFLAGS := \
	$(common_cflags) \
	-Dmain=scardcontrol_main

LOCAL_MODULE_TAGS = eng
LOCAL_MODULE:= libscardcontrol
LOCAL_LDLIBS := -llog
LOCAL_SHARED_LIBRARIES := libpcsclite
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)

$(call import-module,libusb)
