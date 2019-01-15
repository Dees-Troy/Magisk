LOCAL_PATH := $(call my-dir)

# Some handy paths
EXT_PATH := $(LOCAL_PATH)/external
LIBLZMA := $(EXT_PATH)/xz/src/liblzma/api
LIBLZ4 := $(EXT_PATH)/lz4/lib
LIBBZ2 := $(EXT_PATH)/bzip2
LIBFDT := $(EXT_PATH)/dtc/libfdt
LIBUTILS := $(LOCAL_PATH)/utils/include

# magiskboot
include $(CLEAR_VARS)
LOCAL_MODULE := magiskboottwrp
LOCAL_STATIC_LIBRARIES := libmincrypttwrp liblzmamb liblz4mb libbz2 libfdtmb libmagiskutils
LOCAL_SHARED_LIBRARIES := libz
LOCAL_CFLAGS += -Wno-sign-compare -Wno-null-conversion -Wno-sometimes-uninitialized
LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include \
	$(EXT_PATH)/include \
	$(LIBLZMA) \
	$(LIBLZ4) \
	$(LIBBZ2) \
	$(LIBFDT) \
	$(LIBUTILS)

LOCAL_SRC_FILES := \
	magiskboot/main.cpp \
	magiskboot/cpio.cpp \
	magiskboot/bootimg.cpp \
	magiskboot/hexpatch.cpp \
	magiskboot/compress.cpp \
	magiskboot/format.cpp \
	magiskboot/dtb.cpp \
	magiskboot/ramdisk.cpp \
	magiskboot/pattern.cpp

LOCAL_LDLIBS := -lz
include $(BUILD_EXECUTABLE)

include $(LOCAL_PATH)/external/twrp.mk
include $(LOCAL_PATH)/../utils/twrp.mk
include bootable/recovery/libmincrypt/Android.mk
