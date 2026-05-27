cmake_minimum_required(VERSION 3.16)

project(Vectra VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(appVectra
    main.cpp
)

qt_add_qml_module(appVectra
    URI Vectra
    VERSION 1.0
    QML_FILES
        Main.qml
        HomeConfigVideo.qml
        HomeConfigConnection.qml
        HomeConfigMacro.qml
        QML_FILES Login.qml
        QML_FILES HomeConfigAccount.qml
        QML_FILES HomeConfigGamepad.qml
        QML_FILES Home.qml
        QML_FILES Homeaddfriends.qml

        RESOURCES
                assets/Icons/adobe-express-qr-code1.png
                assets/Icons/broadcast_on_home_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/cancel_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/chat_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/check_circle_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/close_fullscreen_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/correto.png
                assets/Icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/Email.png
                assets/Icons/fullscreen_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/game_button_l_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/game_button_r_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/game_trigger_left_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/home_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/keyboard_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/Logout.png
                assets/Icons/logout_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/mail_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/mouse_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/OlhoPassword.png
                assets/Icons/person_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/power_settings_new_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/search_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/stadia_controller_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/toggle_on_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/translate_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/undo_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/Vector.png
                assets/Icons/video_settings_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/videogame_asset_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/visibility_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg
                assets/Icons/Xvermelho.png
                assets/Icons/person_30dp_EFEFEF_FILL0_wght400_GRAD0_opsz24.svg
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appVectra PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appVectra
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appVectra
    PRIVATE Qt6::Quick
)

install(TARGETS appVectra
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
