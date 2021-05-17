# Remove 351Droid bootanimation
cd ../../../../vendor/lineage
git reset --hard
git clean -f -d

cd ../../build/soong
git reset --hard

cd ../../external/compiler-rt
git reset --hard
cd ../libdrm
git reset --hard
git clean -f -d

cd ../../frameworks/av
git reset --hard
git clean -f -d
cd ../base
git reset --hard
git clean -f -d
cd ../native
git reset --hard
git clean -f -d
cd ../opt/net/wifi/
git reset --hard
git clean -f -d

cd ../../../../hardware/interfaces
git reset --hard
git clean -f -d
cd ../libhardware
git reset --hard
git clean -f -d

cd ../../system/core
git reset --hard
git clean -f -d
cd ../hardware/interfaces
git reset --hard
git clean -f -d
cd ../../memory/libion
git reset --hard
git clean -f -d

cd ../../../device/anbernic/common/patches
