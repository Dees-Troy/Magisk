LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE:= libmagiskutils
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../include $(LIBUTILS)
LOCAL_SRC_FILES := \
	new.cpp \
	file.cpp \
	misc.cpp \
	selinux.cpp \
	logging.cpp \
	xwrap.cpp \
	CharArray.cpp

include $(BUILD_STATIC_LIBRARY)
