# Copyright (C) 2009 The Android Open Source Project
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
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := json

SOURCE_PATH := $(LOCAL_PATH)/source/src/lib_json

MY_FILES_SUFFIX := %.cpp %.c %.cc

rwildcard = $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2) $(filter $(subst *,%,$2),$d))

SRC_FILES := $(call rwildcard, $(SOURCE_PATH)/,$(MY_FILES_SUFFIX))

not-containing = $(foreach v,$2,$(if $(findstring $1,$v),,$v))
MY_SRC_FILES := $(call not-containing,DnsResolveTask.cpp,$(SRC_FILES))
#MY_SRC_FILES := $(call not-containing,UdpReliableTask.cpp,$(MY_SRC_FILES))

LOCAL_SRC_FILES :=  $(MY_SRC_FILES:$(LOCAL_PATH)/%=%)

LOCAL_C_INCLUDES := $(SOURCE_PATH) \
					$(SOURCE_PATH)/../../include

include $(BUILD_STATIC_LIBRARY)