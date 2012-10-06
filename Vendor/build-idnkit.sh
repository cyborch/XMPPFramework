#!/bin/sh


SDKVERSION="6.0"
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin

CURRENTPATH=`pwd`
DEVELOPER=`xcode-select --print-path`

cd idnkit-1.0-src

############
# iPhone Simulator
ARCH="i386"
PLATFORM="iPhoneSimulator"
echo "Building idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"
echo "Please stand by..."

LOG="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk/build-idnkit-${ARCH}.log"
mkdir -p "${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk"

export CC="${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/usr/bin/gcc"
export CFLAGS="-arch ${ARCH} -isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk"

echo "Configure idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"

./configure --disable-shared --enable-liteonly > "${LOG}" 2>&1

LIBDIR="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk/lib/${ARCH}"
mkdir -p "${LIBDIR}"

echo "Make idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"

make >> "${LOG}" 2>&1
mv lib/.libs/* "${LIBDIR}" >> "${LOG}" 2>&1
make clean >> "${LOG}" 2>&1
make distclean >> "${LOG}" 2>&1

echo "Building idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}, finished"
#############

#############
# iPhoneOS armv7
ARCH="armv7"
PLATFORM="iPhoneOS"
echo "Building idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"
echo "Please stand by..."

LOG="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk/build-idnkit-${ARCH}.log"
mkdir -p "${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk"

export CC="${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/usr/bin/gcc"
export CFLAGS="-arch ${ARCH} -isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk"

echo "Configure idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"

./configure --disable-shared --enable-liteonly > "${LOG}" 2>&1


LIBDIR="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk/lib/${ARCH}"
mkdir -p "${LIBDIR}"

echo "Make idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"

make >> "${LOG}" 2>&1
mv lib/.libs/* "${LIBDIR}" >> "${LOG}" 2>&1
make clean >> "${LOG}" 2>&1
make distclean >> "${LOG}" 2>&1

echo "Building idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}, finished"
#############

#############
# iPhoneOS armv7s
ARCH="armv7s"
PLATFORM="iPhoneOS"
echo "Building idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"
echo "Please stand by..."

LOG="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk/build-idnkit-${ARCH}.log"
mkdir -p "${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk"

export CC="${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/usr/bin/gcc"
export CFLAGS="-arch ${ARCH} -isysroot ${DEVELOPER}/Platforms/${PLATFORM}.platform/Developer/SDKs/${PLATFORM}${SDKVERSION}.sdk"

echo "Configure idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"

./configure --disable-shared --enable-liteonly > "${LOG}" 2>&1

LIBDIR="${CURRENTPATH}/bin/${PLATFORM}${SDKVERSION}.sdk/lib/${ARCH}"
mkdir -p "${LIBDIR}"

echo "Make idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}"

make >> "${LOG}" 2>&1
mv lib/.libs/* "${LIBDIR}" >> "${LOG}" 2>&1
make clean >> "${LOG}" 2>&1
make distclean >> "${LOG}" 2>&1

echo "Building idnkit for ${PLATFORM} ${SDKVERSION} ${ARCH}, finished"
#############

#############
# Universal Library
echo "Build universal library..."

lipo -create ${CURRENTPATH}/bin/iPhoneSimulator${SDKVERSION}.sdk/lib/i386/libidnkitlite.a ${CURRENTPATH}/bin/iPhoneOS${SDKVERSION}.sdk/lib/armv7/libidnkitlite.a ${CURRENTPATH}/bin/iPhoneOS${SDKVERSION}.sdk/lib/armv7s/libidnkitlite.a -output ${CURRENTPATH}/libidnkitlite.a

mkdir ${CURRENTPATH}/include
cp include/idn/*.h ${CURRENTPATH}/include

echo "Building all steps done."
echo "Cleaning up..."
rm -rf ${CURRENTPATH}/bin
echo "Done."

