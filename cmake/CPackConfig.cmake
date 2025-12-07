### CPackConfig.cmake ###

# General information
set(CPACK_PACKAGE_NAME "lib${PROJECT_NAME}")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "CPack packaging exercise")
set(CPACK_PACKAGE_DESCRIPTION "This is the elaboration for the CPACK packaging exercise by Marcel Graf")
set(CPACK_PACKAGE_VENDOR "Marcel Graf")
set(CPACK_PACKAGE_CONTACT "st172528@stud.uni-stuttgart.de")
set(CPACK_PACKAGE_MAINTAINERS "Marcel Graf <st172528@stud.uni-stuttgart.de>")
set(CPACK_PACKAGE_HOMEPAGE_URL "https://github.com/MarcelGraf0710/cpack-exercise-wt2526")
set(CPACK_PACKAGE_COPYRIGHT "Copyright (c) 2025 Marcel Graf")

# Generators and general properties
set(CPACK_STRIP_FILES ON)
set(CPACK_GENERATOR "TGZ;DEB")
set(CPACK_PACKAGE_DESCRIPTION_FILE "${CMAKE_SOURCE_DIR}/README.md")
set(CPACK_PACKAGE_CHANGELOG_FILE "${CMAKE_SOURCE_DIR}/changelog")
set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/LICENSE")

# Debian package properties

## General information again such that lintian stops complaining
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Marcel Graf <st172528@stud.uni-stuttgart.de>")
set(CPACK_DEBIAN_PACKAGE_CHANGELOG "${CMAKE_SOURCE_DIR}/changelog")
set(CPACK_DEBIAN_PACKAGE_COPYRIGHT "${CMAKE_SOURCE_DIR}/copyright")
set(CPACK_DEB_COMPONENT_INSTALL ON)
set(CPACK_DEBIAN_FILE_NAME DEB-DEFAULT)
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "Marcel Graf <st172528@stud.uni-stuttgart.de>")

## Runtime package
set(CPACK_DEBIAN_RUNTIME_PACKAGE_NAME "libcpackexample1")

## Dev package
set(CPACK_DEBIAN_DEV_PACKAGE_NAME "libcpackexample-dev")
set(CPACK_COMPONENT_DEV_DEPENDS "libcpackexample1")
set(CPACK_DEBIAN_DEV_PACKAGE_DEPENDS "libcpackexample1")

install(FILES ${CMAKE_SOURCE_DIR}/changelog.gz
        DESTINATION "/usr/share/doc/libcpackexample-dev"
        COMPONENT dev)

install(FILES ${CMAKE_SOURCE_DIR}/copyright
        DESTINATION "/usr/share/doc/libcpackexample-dev"
        COMPONENT dev)

install(FILES "${CMAKE_SOURCE_DIR}/man/cpackexample.3.gz"
        DESTINATION ${CMAKE_INSTALL_MANDIR}/man3 
        COMPONENT dev)

# Shared library management
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS ON)
set(CPACK_DEBIAN_PACKAGE_GENERATE_SHLIBS ON)

# CPack
include(CPack)