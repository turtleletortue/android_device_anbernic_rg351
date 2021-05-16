# Soong patch

cd ../../../../build/soong
patch -p1 < ../../device/anbernic/common/patches/build/soong/Soong.patch

# External patches
cd ../../external/compiler-rt
patch -p1 < ../../device/anbernic/common/patches/external/compiler-rt/compiler-rt.patch
cd ../libdrm
patch -p1 < ../../device/anbernic/common/patches/external/libdrm/libdrm.patch

# Frameworks patches
cd ../../frameworks/av
patch -p1 < ../../device/anbernic/common/patches/frameworks/av/frameworks_av.patch
cd ../base
patch -p1 < ../../device/anbernic/common/patches/frameworks/base/frameworks_base.patch
cd ../native
patch -p1 < ../../device/anbernic/common/patches/frameworks/native/frameworks_native.patch
cd ../opt/net/wifi/
patch -p1 < ../../../../device/anbernic/common/patches/frameworks/opt/net/wifi/frameworks_opt.patch

# Hardware patches
cd ../../../../hardware/interfaces
patch -p1 < ../../device/anbernic/common/patches/hardware/interfaces/hardware_interfaces.patch
cd ../libhardware
patch -p1 < ../../device/anbernic/common/patches/hardware/libhardware/libhardware.patch

# System patches
cd ../../system/core
patch -p1 < ../../device/anbernic/common/patches/system/core/system_core.patch
cd ../hardware/interfaces
patch -p1 < ../../../device/anbernic/common/patches/system/hardware/interfaces/hardware_interfaces.patch
cd ../../memory/libion
patch -p1 < ../../../device/anbernic/common/patches/system/memory/libion/libion.patch

cd ../../../device/anbernic/common/patches
