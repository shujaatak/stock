
TEMPLATE = app
TARGET = Stock.Mobile
QT += qml
CONFIG += c++14 qzxing_qml
DEFINES += CFGFILE_QT_SUPPORT

OTHER_FILES = qml/main.qml

SOURCES = main.cpp

HEADERS =

RESOURCES = resources.qrc

DISTFILES += qml/main.qml

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += android/AndroidManifest.xml

include( ../../3rdparty/qzxing/qzxing/QZXing.pri )
include( ../shared/shared.pri )
include( ../../3rdparty/cfgfile/cfgfile/cfgfile.pri )

TO_GENERATE = ../shared/messages.cfgfile

QMAKE_EXTRA_COMPILERS += generate_cfg
generate_cfg.name = CONF_GEN
generate_cfg.input = TO_GENERATE
generate_cfg.output = ${QMAKE_FILE_BASE}.hpp
generate_cfg.CONFIG = no_link
generate_cfg.variable_out = HEADERS

CFGFILE_GENERATOR = $$cat( $$PWD/../desktop/cfgfile_generator_path )

generate_cfg.commands = $${CFGFILE_GENERATOR} \
-i ${QMAKE_FILE_IN} -o $${OUT_PWD}/${QMAKE_FILE_BASE}.hpp

PRE_TARGETDEPS += compiler_generate_cfg_make_all
