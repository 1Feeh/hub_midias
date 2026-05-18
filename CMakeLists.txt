cmake_minimum_required(VERSION 3.16)

project(Vectra VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.10)

qt_add_executable(Vectra
    src/main.cpp
)

# 5. Configura explicitamente o Colors.qml como um Singleton no CMake
set_source_files_properties(qml/Colors.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)

qt_add_qml_module(Vectra
    URI Vectra
    QML_FILES
        qml/Colors.qml

        qml/Login.qml
        qml/Home.qml
    RESOURCES
        assets/icons/assistant_on_hub_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/adobe-express-qr-code1.png
	assets/icons/cancel_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/chat_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/check_circle_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/close_fullscreen_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/correto.png
	assets/icons/desktop_windows_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/display_settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/Email.png
	assets/icons/fullscreen_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/game_button_l_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/game_button_r_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/game_trigger_left_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/group_add_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/home_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/keyboard_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/lan_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/Logout.png
	assets/icons/logout_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/manage_accounts_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/mouse_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/OlhoPassword.png
	assets/icons/person_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/power_settings_new_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/search_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/settings_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/stadia_controller_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/toggle_on_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/translate_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/undo_24dp_E3E3E3_FILL0_wght400_GRAD0_opsz24.svg
	assets/icons/Vector.png
	assets/icons/Xvermelho.png
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
