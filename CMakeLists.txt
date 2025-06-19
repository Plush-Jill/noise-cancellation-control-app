cmake_minimum_required(VERSION 3.30)
project(NCC-App VERSION 0.0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)

set(CMAKE_PREFIX_PATH "/home/plush-jill/All_Random/Qt/6.9.0/gcc_64/lib/cmake")

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)


find_package(Qt6 6.9 REQUIRED COMPONENTS
        Core
        Widgets
        Qml
        Quick
)

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

#add_executable(NCC-App
#        src/main.cpp
#)

qt_add_executable(NCC-App
        src/main.cpp
)

qt_add_qml_module(NCC-App
        URI NCC-App
        VERSION 1.0
        QML_FILES src/qml/main.qml
        OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/src/qml"
        RESOURCES src/qml/resources.qrc
)

target_link_libraries(NCC-App PRIVATE
        Qt6::Core
        Qt6::Widgets
        Qt6::Qml
        Qt6::Quick
)