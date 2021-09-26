# Art patch

cd ../../../../art
patch -p1 < ../device/anbernic/common/patches/art/9843b4182a27c82ab6a0513c39f893bb18eafcb9.patch

# Bionic patch

cd ../bionic
patch -p1 < ../device/anbernic/common/patches/bionic/61f715c4fc084e4eef977a29f5cf0ab8256e92b4.patch
patch -p1 < ../device/anbernic/common/patches/bionic/826f7707689b66d0b46ab4ba97315b5dc61a0042.patch


# Soong patch

cd ../build/soong
echo "Patching build/soong"
patch -p1 < ../../device/anbernic/common/patches/build/soong/Soong.patch

# External patches
cd ../../external/compiler-rt
echo "Patching external/compiler-rt"
patch -p1 < ../../device/anbernic/common/patches/external/compiler-rt/compiler-rt.patch
cd ../libdrm
echo "Patching external/libdrm"
patch -p1 < ../../device/anbernic/common/patches/external/libdrm/libdrm.patch

# Frameworks patches
cd ../../frameworks/av
echo "Patching frameworks/av"
patch -p1 < ../../device/anbernic/common/patches/frameworks/av/frameworks_av.patch
cd ../base
echo "Patching frameworks/base"
patch -p1 < ../../device/anbernic/common/patches/frameworks/base/frameworks_base.patch
patch -p1 < ../../device/anbernic/common/patches/frameworks/base/4caddd350b87596c59fa68abe48732449b76c724.patch
patch -p1 < ../../device/anbernic/common/patches/frameworks/base/d3319b8762e6499cb70bf7b134cb812615e9b722.patch
cd ../native
echo "Patching frameworks/native"
patch -p1 < ../../device/anbernic/common/patches/frameworks/native/frameworks_native.patch
cd ../opt/net/wifi/
echo "Patching frameworks/opt/net/wifi/"
patch -p1 < ../../../../device/anbernic/common/patches/frameworks/opt/net/wifi/frameworks_opt.patch

# Hardware patches
cd ../../../../hardware/interfaces
echo "Patching hardware/interfaces"
patch -p1 < ../../device/anbernic/common/patches/hardware/interfaces/hardware_interfaces.patch
cd ../libhardware
echo "Patching hardware/libhardware"
patch -p1 < ../../device/anbernic/common/patches/hardware/libhardware/libhardware.patch

# System patches
cd ../../system/core
echo "Patching system/core"
patch -p1 < ../../device/anbernic/common/patches/system/core/system_core.patch
patch -p1 < ../../device/anbernic/common/patches/system/core/healthd/0001-remove-battery-log.patch
patch -p1 < ../../device/anbernic/common/patches/system/core/rootdir/4c6eb4bfbc08ee2467ab7a90c10ead2ac9185bc2.patch
cd ../hardware/interfaces
echo "Patching system/hardware/interfaces"
patch -p1 < ../../../device/anbernic/common/patches/system/hardware/interfaces/hardware_interfaces.patch
cd ../../memory/libion
echo "Patching system/memory/libion"
patch -p1 < ../../../device/anbernic/common/patches/system/memory/libion/libion.patch

cd ../../../build/make
echo "Patching build/make"
patch -p1 < ../../device/anbernic/common/patches/build/make/build_make.patch

cd ../../packages/apps/Settings
echo "Patching packages/apps/Settings"
patch -p1 < ../../../device/anbernic/common/patches/packages/apps/Settings/0001-fixed-Settings-Can-t-scroll-to-the-bottom.patch

cd ../../../device/anbernic/common/patches
