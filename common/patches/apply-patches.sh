# Soong patch

cd ../../../../build/soong
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
cd ../hardware/interfaces
echo "Patching system/hardware/interfaces"
patch -p1 < ../../../device/anbernic/common/patches/system/hardware/interfaces/hardware_interfaces.patch
cd ../../memory/libion
echo "Patching system/memory/libion"
patch -p1 < ../../../device/anbernic/common/patches/system/memory/libion/libion.patch

cd ../../../device/anbernic/common/patches
