source build/envsetup.sh

# timezone
export TZ=Asia/Kolkata

# user and home
export BUILD_USERNAME=home
export BUILD_HOSTNAME=grepfox

# Vanilla
export YAAP_BUILDTYPE=Banshee
export TARGET_BUILD_GAPPS=true
lunch yaap_vayu-user
m yaap
mkdir -p release-files
cp -r out/target/product/vayu/YAAP-16* release-files/
cp -r out/target/product/vayu/vayu.json release-files/vayu_vanilla.json

# Gapps
export YAAP_BUILDTYPE=Banshee
export TARGET_BUILD_GAPPS=true
lunch yaap_vayu-user
m yaap
mkdir -p release-files
cp -r out/target/product/vayu/YAAP-16* release-files/
cp -r out/target/product/vayu/vayu.json release-files/
