include(CTest)
if(BUILD_TESTING)
  add_subdirectory(test)
endif()
{type exe}
add_custom_target(
    run_exe
    COMMAND "$<TARGET_FILE:%(name)s_%(name)s>"
    VERBATIM
)
{end}
option(BUILD_MCSS_DOCS "Build documentation using Doxygen and m.css" OFF)
if(BUILD_MCSS_DOCS)
  include(cmake/docs.cmake)
endif()

option(ENABLE_COVERAGE "Enable coverage support separate from CTest's" OFF)
if(ENABLE_COVERAGE)
  include(cmake/coverage.cmake)
endif()

if(CMAKE_SYSTEM_NAME STREQUAL "Windows")
  include(cmake/open-cpp-coverage.cmake OPTIONAL)
endif()

include(cmake/lint-targets.cmake)
include(cmake/spell-targets.cmake)
