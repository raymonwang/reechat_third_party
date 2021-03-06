PROJECT(rtc_base)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../)
if(UNIX)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../libevent2/include)
endif()

file(GLOB_RECURSE rtc_base 
  "${CMAKE_CURRENT_SOURCE_DIR}/rtc_base/*.cc" 
  "${CMAKE_CURRENT_SOURCE_DIR}/rtc_base/*.mm"
  )
list(FILTER rtc_base EXCLUDE REGEX ".*test")
list(FILTER rtc_base EXCLUDE REGEX ".*win32")
list(FILTER rtc_base EXCLUDE REGEX ".*_win")
list(FILTER rtc_base EXCLUDE REGEX ".*json")
if(APPLE)
list(FILTER rtc_base EXCLUDE REGEX ".*messagedigest.cc")
list(FILTER rtc_base EXCLUDE REGEX ".*_libevent.cc")
elseif(UNIX)
list(FILTER rtc_base EXCLUDE REGEX ".*\.mm")
message(${rtc_base})
list(FILTER rtc_base EXCLUDE REGEX "macifaddrs_converter.cc")
list(FILTER rtc_base EXCLUDE REGEX "macutils.cc")
list(FILTER rtc_base EXCLUDE REGEX "task_queue_gcd.cc")
endif()
list(APPEND rtc_base "${CMAKE_CURRENT_SOURCE_DIR}/rtc_base/common.cc")

if(APPLE)
add_definitions(-DWEBRTC_POSIX -DWEBRTC_MAC)
elseif(UNIX)
add_definitions(-DWEBRTC_POSIX -DWEBRTC_LINUX -DWEBRTC_BUILD_LIBEVENT -D__STDC_FORMAT_MACROS)
endif()

add_library(rtc_base STATIC ${rtc_base})

target_compile_options(
	rtc_base PRIVATE -std=gnu++11
)




