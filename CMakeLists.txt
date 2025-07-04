cmake_minimum_required(VERSION 3.29.1)
project(NCC-App VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)


set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)


find_package(Qt6 6.9 REQUIRED COMPONENTS
        Core
        Widgets
        Qml
        Quick
        Bluetooth
)

qt_policy(SET QTP0001 NEW)
qt_policy(SET QTP0004 NEW)

qt_add_executable(NCC-App
        src/main.cpp
        src/bluetooth-standard/abstract-standard.cpp
        include/bluetooth-standard/abstract-standard.hpp
        include/noise-cancellation-mode.hpp
        src/bluetooth-manager.cpp
        include/bluetooth-manager.hpp
)

set_target_properties(NCC-App PROPERTIES WIN32_EXECUTABLE TRUE)

qt_add_qml_module(NCC-App
        URI NCC-App
        VERSION 1.0
        QML_FILES
        src/qml/old-main.qml
        src/qml/main.qml
            src/qml/ModeButton.qml
            src/qml/NoiseCancellationModeMenu.qml
            src/qml/WindowControls.qml
            src/qml/DeviceSelector.qml
        OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/src/qml"
        RESOURCES src/qml/resources.qrc
)

target_link_libraries(NCC-App PRIVATE
        Qt6::Core
        Qt6::Widgets
        Qt6::Qml
        Qt6::Quick
        Qt6::Bluetooth
)