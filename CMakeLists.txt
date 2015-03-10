project(pvr.wmc)

cmake_minimum_required(VERSION 2.6)

enable_language(CXX)

find_package(kodi REQUIRED)
find_package(kodiplatform REQUIRED)

include_directories(${kodiplatform_INCLUDE_DIRS}
                    ${KODI_INCLUDE_DIR}
                    ${CMAKE_BINARY_DIR})

add_definitions(-DUSE_DEMUX)

set(WMC_SOURCES src/client.cpp
                src/DialogDeleteTimer.cpp
                src/DialogRecordPref.cpp
                src/pvr2wmc.cpp
                src/Socket.cpp
                src/utilities.cpp)

set(DEPLIBS ${kodiplatform_LIBRARIES})
if (WIN32)
  list(APPEND DEPLIBS ws2_32)
endif()

build_addon(pvr.wmc WMC DEPLIBS)

add_custom_target(OUTPUT ${CMAKE_BINARY_DIR}/clientversion.h
                  COMMAND ${CMAKE_COMMAND}
                          -DPROJECT_SOURCE_DIR=${PROJECT_SOURCE_DIR}
                          -DCMAKE_BINARY_DIR=${CMAKE_BINARY_DIR}
                          -P generateversionedfile.cmake
                  DEPENDS ${PROJECT_SOURCE_DIR}/src/clientversion.h.in
                          ${PROJECT_SOURCE_DIR}/pvr.wmc/addon.xml)

add_custom_target(generate-versioned-files DEPENDS ${CMAKE_BINARY_DIR}/clientversion.h)
add_dependencies(pvr.wmc generate-versioned-files)

include(CPack)
