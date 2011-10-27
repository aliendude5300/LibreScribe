#------------------------------------------------------------------------------#
# This makefile was generated by 'cbp2make' tool rev.120                       #
#------------------------------------------------------------------------------#


WRKDIR = `pwd`

CC = gcc
CXX = g++
AR = ar
LD = g++
WINDRES = windres

INC =  -I/usr/include/libxml2 -Iinclude -Ilibusb/libusb
CFLAGS =  -Wall `wx-config --cflags` -Winvalid-pch -include wx_pch.h `python-config --include` `pkg-config --libs --cflags glib-2.0` -DWX_PRECOMP
RESINC = 
LIBDIR =  -Llibusb/libusb/.libs -Llibusb/libusb
LIB =  -lopenobex -lxml2 -ludev libusb/libusb/.libs/libusb-1.0.a libusb/libusb/.libs/libusb-1.0.so
LDFLAGS =  `wx-config --libs` `python-config --libs` -lglib-2.0

INC_DEBUG =  $(INC)
CFLAGS_DEBUG =  $(CFLAGS) -O3 -g
RESINC_DEBUG =  $(RESINC)
RCFLAGS_DEBUG =  $(RCFLAGS)
LIBDIR_DEBUG =  $(LIBDIR) -Llibusb/libusb
LIB_DEBUG = $(LIB)
LDFLAGS_DEBUG =  $(LDFLAGS)
OBJDIR_DEBUG = obj/Debug
DEP_DEBUG = 
OUT_DEBUG = bin/Debug/LibreScribe

INC_RELEASE =  $(INC)
CFLAGS_RELEASE =  $(CFLAGS) -O3
RESINC_RELEASE =  $(RESINC)
RCFLAGS_RELEASE =  $(RCFLAGS)
LIBDIR_RELEASE =  $(LIBDIR)
LIB_RELEASE = $(LIB)
LDFLAGS_RELEASE =  -s $(LDFLAGS)
OBJDIR_RELEASE = obj/Release
DEP_RELEASE = 
OUT_RELEASE = bin/Release/LibreScribe

OBJ_DEBUG = $(OBJDIR_DEBUG)/DeviceInfo.o $(OBJDIR_DEBUG)/GUIFrame.o $(OBJDIR_DEBUG)/LibreScribe.o $(OBJDIR_DEBUG)/src/BackgroundMonitor.o $(OBJDIR_DEBUG)/src/Smartpen.o

OBJ_RELEASE = $(OBJDIR_RELEASE)/DeviceInfo.o $(OBJDIR_RELEASE)/GUIFrame.o $(OBJDIR_RELEASE)/LibreScribe.o $(OBJDIR_RELEASE)/src/BackgroundMonitor.o $(OBJDIR_RELEASE)/src/Smartpen.o

all: before_build build_Debug build_Release after_build

clean: clean_Debug clean_Release

before_build: 
	cd $(PROJECT_DIRECTORY) && rm -rfv ./bin
	cd $(PROJECT_DIRECTORY)libusb/ && [ -f configure ] || sh autogen.sh
	cd $(PROJECT_DIRECTORY)libusb/ && [ -f Makefile ] || ./configure
	cd $(PROJECT_DIRECTORY)libusb/ && [ -f libusb/.libs/libusb-1.0.a ] || make

after_build: 
	cd $(PROJECT_DIRECTORY)
	find ./bin/ -mindepth 1 -maxdepth 1 -type d | xargs -n 1 cp -rfv -L ./res ./xdg
	find ./bin/ -mindepth 1 -maxdepth 1 -type d | xargs -n 1 cp -fv -L ./stf.py ./convert_stfs.sh

before_Debug: 
	test -d bin/Debug || mkdir -p bin/Debug
	test -d $(OBJDIR_DEBUG) || mkdir -p $(OBJDIR_DEBUG)
	test -d $(OBJDIR_DEBUG)/src || mkdir -p $(OBJDIR_DEBUG)/src

after_Debug: 

build_Debug: before_Debug out_Debug after_Debug

Debug: before_build build_Debug after_build

out_Debug: $(OBJ_DEBUG) $(DEP_DEBUG)
	$(LD) $(LDFLAGS_DEBUG) $(LIBDIR_DEBUG) $(OBJ_DEBUG) $(LIB_DEBUG) -o $(OUT_DEBUG)

$(OBJDIR_DEBUG)/DeviceInfo.o: DeviceInfo.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c DeviceInfo.cpp -o $(OBJDIR_DEBUG)/DeviceInfo.o

$(OBJDIR_DEBUG)/GUIFrame.o: GUIFrame.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c GUIFrame.cpp -o $(OBJDIR_DEBUG)/GUIFrame.o

$(OBJDIR_DEBUG)/LibreScribe.o: LibreScribe.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c LibreScribe.cpp -o $(OBJDIR_DEBUG)/LibreScribe.o

$(OBJDIR_DEBUG)/src/BackgroundMonitor.o: src/BackgroundMonitor.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/BackgroundMonitor.cpp -o $(OBJDIR_DEBUG)/src/BackgroundMonitor.o

$(OBJDIR_DEBUG)/src/Smartpen.o: src/Smartpen.cpp
	$(CXX) $(CFLAGS_DEBUG) $(INC_DEBUG) -c src/Smartpen.cpp -o $(OBJDIR_DEBUG)/src/Smartpen.o

clean_Debug: 
	rm -f $(OBJ_DEBUG) $(OUT_DEBUG)
	rm -rf bin/Debug
	rm -rf $(OBJDIR_DEBUG)
	rm -rf $(OBJDIR_DEBUG)/src

before_Release: 
	test -d bin/Release || mkdir -p bin/Release
	test -d $(OBJDIR_RELEASE) || mkdir -p $(OBJDIR_RELEASE)
	test -d $(OBJDIR_RELEASE)/src || mkdir -p $(OBJDIR_RELEASE)/src

after_Release: 

build_Release: before_Release out_Release after_Release

Release: before_build build_Release after_build

out_Release: $(OBJ_RELEASE) $(DEP_RELEASE)
	$(LD) $(LDFLAGS_RELEASE) $(LIBDIR_RELEASE) $(OBJ_RELEASE) $(LIB_RELEASE) -o $(OUT_RELEASE)

$(OBJDIR_RELEASE)/DeviceInfo.o: DeviceInfo.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c DeviceInfo.cpp -o $(OBJDIR_RELEASE)/DeviceInfo.o

$(OBJDIR_RELEASE)/GUIFrame.o: GUIFrame.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c GUIFrame.cpp -o $(OBJDIR_RELEASE)/GUIFrame.o

$(OBJDIR_RELEASE)/LibreScribe.o: LibreScribe.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c LibreScribe.cpp -o $(OBJDIR_RELEASE)/LibreScribe.o

$(OBJDIR_RELEASE)/src/BackgroundMonitor.o: src/BackgroundMonitor.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/BackgroundMonitor.cpp -o $(OBJDIR_RELEASE)/src/BackgroundMonitor.o

$(OBJDIR_RELEASE)/src/Smartpen.o: src/Smartpen.cpp
	$(CXX) $(CFLAGS_RELEASE) $(INC_RELEASE) -c src/Smartpen.cpp -o $(OBJDIR_RELEASE)/src/Smartpen.o

clean_Release: 
	rm -f $(OBJ_RELEASE) $(OUT_RELEASE)
	rm -rf bin/Release
	rm -rf $(OBJDIR_RELEASE)
	rm -rf $(OBJDIR_RELEASE)/src

.PHONY: before_build after_build before_Debug after_Debug clean_Debug before_Release after_Release clean_Release

