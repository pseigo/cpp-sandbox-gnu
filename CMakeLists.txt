cmake_minimum_required(VERSION 3.18)

project(Sandbox
  VERSION 0.0.1
  DESCRIPTION "Coding sandbox"
  LANGUAGES CXX
)

# Require out-of-source builds
file(TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
if(EXISTS "${LOC_PATH}")
  message(FATAL_ERROR "You cannot build in a source directory (or any directory with a CMakeLists.txt file). Please make a build subdirectory. Feel free to remove CMakeCache.txt and CMakeFiles.")
endif()

# Only run if this is the main project (i.e., not added via add_subdirectory)
if(CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
  set(CMAKE_CXX_STANDARD 14)
  set(CMAKE_CXX_STANDARD_REQUIRED ON)
  set(CMAKE_CXX_EXTENSIONS OFF) # Ensure -std=c++xx instead of -std=g++xx

  # Support folders in IDEs
  set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

### PROJECT SETUP

if(NOT CMAKE_DEBUG_POSTFIX)
  set(CMAKE_DEBUG_POSTFIX d)
endif()

# Variables
set(SOURCE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp other.cpp)
set(HEADER_FILES ${CMAKE_CURRENT_SOURCE_DIR}/other.hpp)

# Define library target
add_executable(${PROJECT_NAME} ${SOURCE_FILES} ${HEADER_FILES})
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
target_compile_options(${PROJECT_NAME} PRIVATE -Werror -Wall -Wextra -pedantic)
target_precompile_headers(${PROJECT_NAME} PUBLIC /usr/include/x86_64-linux-gnu/c++/9/bits/stdc++.h)
