find_package(kodi)

addon_version(${PROJECT_SOURCE_DIR}/pvr.wmc WMC)
configure_file(${PROJECT_SOURCE_DIR}/src/clientversion.h.in
               ${CMAKE_BINARY_DIR}/clientversion.h @ONLY)
