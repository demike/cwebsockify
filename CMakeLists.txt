cmake_minimum_required(VERSION 3.0)

set (CMAKE_C_FLAGS "-m32")

set(CMAKE_POSITION_INDEPENDENT_CODE ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

project(websockify C)


set(websockify_src
    websocket.c
    websockify.c
    )
set(websockify_hdr 
    websocket.h)


add_executable(${PROJECT_NAME} ${websockify_src} ${websockify_hdr})

target_link_libraries(${PROJECT_NAME}
            ssl
            crypto)   
