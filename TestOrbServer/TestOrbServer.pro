TEMPLATE = app
CONFIG += console c++17
CONFIG -= app_bundle
CONFIG -= qt


SOURCES += \
        echoSK.cc \
        main.cpp


HEADERS += \
    echo.hh

CONFIG += exceptions
DEFINES+=__WIN32__
DEFINES+=__x86__
DEFINES+=_WIN32_WINNT=0x0400
DEFINES+=__NT__
DEFINES+=__OSVERSION__=4
INCLUDEPATH += $$PWD/../../../omniORB-4.2.3/include
DEPENDPATH += $$PWD/../../../omniORB-4.2.3/bin/x86_win32
QMAKE_CXXFLAGS_DEBUG += /MDd
QMAKE_CXXFLAGS_RELEASE += /MD



win32: LIBS += -lMsWSock


win32: LIBS += -lAdvAPI32


win32: LIBS += -lWS2_32




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomniORB4_rt
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomniORB4_rtd
else:unix: LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomniORB4_rt



win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomnithread_rt
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomnithread_rtd
else:unix: LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomnithread_rt


win32:CONFIG(release, debug|release): LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomniDynamic4_rt
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomniDynamic4_rtd
else:unix: LIBS += -L$$PWD/../../../omniORB-4.2.3/bin/x86_win32/ -lomniDynamic4_rt
