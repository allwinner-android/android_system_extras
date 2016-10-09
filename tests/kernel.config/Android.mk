# Copyright 2016 The Android Open Source Project

LOCAL_PATH:= $(call my-dir)

# -----------------------------------------------------------------------------
# Unit tests.
# -----------------------------------------------------------------------------

test_c_flags := \
    -fstack-protector-all \
    -g \
    -Wall -Wextra \
    -Werror \
    -fno-builtin \

# Required Tests
cts_src_files := \
    aslr_test.cpp \
    multicast_test.cpp \
    pstore_test.cpp \
    sysvipc_test.cpp \
    logger_test.cpp

# Required plus Recommended Tests
test_src_files := \
    $(cts_src_files) \
    aslr_rec_test.cpp \
    mmc_max_speed_test.cpp \

include $(CLEAR_VARS)
LOCAL_MODULE := kernel-config-unit-tests
LOCAL_MODULE_TAGS := tests
LOCAL_CFLAGS := $(test_c_flags)
LOCAL_CFLAGS := -DHAS_KCMP
LOCAL_SRC_FILES := $(test_src_files)
include $(BUILD_NATIVE_TEST)

include $(CLEAR_VARS)
LOCAL_MODULE := CtsKernelConfigTestCases
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS := $(test_c_flags)
LOCAL_CFLAGS := -DHAS_KCMP
LOCAL_SRC_FILES := $(cts_src_files)
LOCAL_MODULE_PATH := $(TARGET_OUT_DATA)/nativetest
LOCAL_MULTILIB := both
LOCAL_MODULE_STEM_32 := $(LOCAL_MODULE)32
LOCAL_MODULE_STEM_64 := $(LOCAL_MODULE)64
LOCAL_STATIC_LIBRARIES := libgtest libgtest_main

LOCAL_COMPATIBILITY_SUITE := cts_v2
LOCAL_CTS_TEST_PACKAGE := android.kernel.config
include $(BUILD_CTS_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    scrape_mmap_addr.cpp

LOCAL_MODULE := scrape_mmap_addr
include $(BUILD_NATIVE_TEST)
