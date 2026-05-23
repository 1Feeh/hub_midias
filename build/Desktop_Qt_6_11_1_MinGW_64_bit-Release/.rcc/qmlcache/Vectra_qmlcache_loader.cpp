#include <QtQml/qqmlprivate.h>
#include <QtCore/qdir.h>
#include <QtCore/qurl.h>
#include <QtCore/qhash.h>
#include <QtCore/qstring.h>

namespace QmlCacheGeneratedCode {
namespace _qt_qml_Vectra_qml_Colors_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_Login_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_Home_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_ConfigAccount_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_ConfigConnection_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_ConfigGamepad_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_ConfigMacro_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_ConfigVideo_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_Homeaddfriends_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}
namespace _qt_qml_Vectra_qml_Init_qml { 
    extern const unsigned char qmlData[];
    extern const QQmlPrivate::AOTCompiledFunction aotBuiltFunctions[];
    const QQmlPrivate::CachedQmlUnit unit = {
        reinterpret_cast<const QV4::CompiledData::Unit*>(&qmlData), &aotBuiltFunctions[0], nullptr
    };
}

}
namespace {
struct Registry {
    Registry();
    ~Registry();
    QHash<QString, const QQmlPrivate::CachedQmlUnit*> resourcePathToCachedUnit;
    static const QQmlPrivate::CachedQmlUnit *lookupCachedUnit(const QUrl &url);
};

Q_GLOBAL_STATIC(Registry, unitRegistry)


Registry::Registry() {
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/Colors.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_Colors_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/Login.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_Login_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/Home.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_Home_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/ConfigAccount.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_ConfigAccount_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/ConfigConnection.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_ConfigConnection_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/ConfigGamepad.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_ConfigGamepad_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/ConfigMacro.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_ConfigMacro_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/ConfigVideo.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_ConfigVideo_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/Homeaddfriends.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_Homeaddfriends_qml::unit);
    resourcePathToCachedUnit.insert(QStringLiteral("/qt/qml/Vectra/qml/Init.qml"), &QmlCacheGeneratedCode::_qt_qml_Vectra_qml_Init_qml::unit);
    QQmlPrivate::RegisterQmlUnitCacheHook registration;
    registration.structVersion = 0;
    registration.lookupCachedQmlUnit = &lookupCachedUnit;
    QQmlPrivate::qmlregister(QQmlPrivate::QmlUnitCacheHookRegistration, &registration);
}

Registry::~Registry() {
    QQmlPrivate::qmlunregister(QQmlPrivate::QmlUnitCacheHookRegistration, quintptr(&lookupCachedUnit));
}

const QQmlPrivate::CachedQmlUnit *Registry::lookupCachedUnit(const QUrl &url) {
    if (url.scheme() != QLatin1String("qrc"))
        return nullptr;
    QString resourcePath = QDir::cleanPath(url.path());
    if (resourcePath.isEmpty())
        return nullptr;
    if (!resourcePath.startsWith(QLatin1Char('/')))
        resourcePath.prepend(QLatin1Char('/'));
    return unitRegistry()->resourcePathToCachedUnit.value(resourcePath, nullptr);
}
}
int QT_MANGLE_NAMESPACE(qInitResources_qmlcache_Vectra)() {
    ::unitRegistry();
    return 1;
}
Q_CONSTRUCTOR_FUNCTION(QT_MANGLE_NAMESPACE(qInitResources_qmlcache_Vectra))
int QT_MANGLE_NAMESPACE(qCleanupResources_qmlcache_Vectra)() {
    return 1;
}
