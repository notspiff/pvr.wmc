project(pvr.wmc)

cmake_minimum_required(VERSION 2.6)

enable_language(CXX)

find_package(xbmc REQUIRED)
find_package(xbmcplatform REQUIRED)

include_directories(${xbmcplatform_INCLUDE_DIRS}
                    ${XBMC_INCLUDE_DIR})

add_definitions(-DUSE_DEMUX)

set(WMC_SOURCES src/client.cpp
                src/DialogDeleteTimer.cpp
                src/DialogRecordPref.cpp
                src/pvr2wmc.cpp
                src/Socket.cpp
                src/utilities.cpp)

set(DEPLIBS ${xbmcplatform_LIBRARIES})

build_addon(pvr.wmc WMC DEPLIBS)

include(CPack)
