PROJECT(hiredis)
CMAKE_MINIMUM_REQUIRED(VERSION 2.6)

add_library(hiredis STATIC net.c hiredis.c sds.c async.c)

