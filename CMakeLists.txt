cmake_minimum_required(VERSION 3.16)

project(Vectra VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(Vectra
    src/main.cpp
    app.rc
)

# 5. Configura explicitamente o Colors.qml como um Singleton no CMake
set_source_files_properties(qml/Colors.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(Vectra
    URI Vectra
    QML_FILES
        qml/Login.qml
        qml/Home.qml
        qml/CAccount.qml
        qml/CConnection.qml
        qml/CGamepad.qml
        qml/CMacro.qml
        qml/CVideo.qml
        qml/Friends.qml
        qml/Init.qml
        qml/Colors.qml
    RESOURCES
        assets/icons/cancelar.svg
        assets/icons/chat.svg
        assets/icons/check_circle.svg
        assets/icons/close_fullscreen.svg
        assets/icons/conection.svg
        assets/icons/conf_control.svg
        assets/icons/control_map.png
        assets/icons/controller.svg
        assets/icons/del_friend.svg
        assets/icons/desktop_windows.svg
        assets/icons/display_settings.svg
        assets/icons/eye.svg
        assets/icons/friend_add.svg
        assets/icons/fullscreen.svg
        assets/icons/home.svg
        assets/icons/keyboard.svg
        assets/icons/logout.svg
        assets/icons/mail.svg
        assets/icons/mouse.svg
        assets/icons/person.svg
        assets/icons/qrcode.png
        assets/icons/search.svg
        assets/icons/settings.svg
        assets/icons/toggle_on_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
        assets/icons/Vector.png
        QML_FILES qml/HomeScreen.qml
        SOURCES src/controller.h
        SOURCES src/controller.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(Vectra PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appuntitled
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(Vectra
    PRIVATE Qt6::Quick
)

install(TARGETS Vectra
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
