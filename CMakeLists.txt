project(pvr.wmc)

cmake_minimum_required(VERSION 2.6)

enable_language(CXX)

find_package(kodi REQUIRED)
find_package(kodiplatform REQUIRED)

include_directories(${KODIPLATFORM_INCLUDE_DIRS}
                    ${KODI_INCLUDE_DIR})

add_definitions(-DUSE_DEMUX)

set(WMC_SOURCES src/client.cpp
                src/DialogDeleteTimer.cpp
                src/DialogRecordPref.cpp
                src/pvr2wmc.cpp
                src/Socket.cpp
                src/utilities.cpp)

set(DEPLIBS ${KODIPLATFORM_LIBRARIES})

build_addon(pvr.wmc WMC DEPLIBS)

include(CPack)
