# 351Droid bootanimation
echo "Adding 351Droid Bootanimation"

cd ../../../../vendor/lineage

git apply -p1 < ../../device/anbernic/common/patches/351droid/vendor/lineage/0001-351droid-bootanimation.patch

echo "Launching normal patch script"

cd ../../device/anbernic/common/patches

sh apply-patches.sh
