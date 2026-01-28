# init repo
repo init -u https://github.com/yaap/manifest.git -b sixteen --git-lfs

# clone device stuff
git clone https://github.com/grepfox/local_manifest -b yaap .repo/local_manifests

# sync rom
repo sync -j$(nproc --all) --no-tags --no-clone-bundle --current-branch

# clone and displayfeatures
rm -rf packages/apps/DisplayFeatures
git clone https://github.com/yaap/packages_apps_DisplayFeatures packages/apps/DisplayFeatures

# Signing keys
rm -rf vendor/yaap/signing/keys
git clone https://github.com/grepfox/yaap_sign vendor/yaap/signing/keys -b lexus

# setup build env
source build/envsetup.sh

# timezone
export TZ=Asia/Kolkata

# user and home
export BUILD_USERNAME=home
export BUILD_HOSTNAME=grepfox

# Vanilla
#export YAAP_BUILDTYPE=Vanilla
export TARGET_BUILD_GAPPS=false
export FORCE_JSON=1
lunch yaap_lexus-user
m yaap
mkdir -p release-files/vanilla
cp -r out/target/product/lexus/YAAP-16* release-files/vanilla
cp -r out/target/product/lexus/vayu.json release-files/vanilla
cp ./out/target/product/lexus/obj/PACKAGING/target_files_intermediates/yaap_lexus-target_files/IMAGES/{boot.img,init_boot.img,vendor_boot.img,recovery.img,dtbo.img,vbmeta.img} release-files/vanilla

# Gapps
#export YAAP_BUILDTYPE=Banshee
export TARGET_BUILD_GAPPS=true
export FORCE_JSON=1
lunch yaap_lexus-user
m yaap
cp -r out/target/product/lexus/YAAP-16* release-files/
cp -r out/target/product/lexus/lexus.json release-files/
cp ./out/target/product/lexus/obj/PACKAGING/target_files_intermediates/yaap_lexus-target_files/IMAGES/{boot.img,init_boot.img,vendor_boot.img,recovery.img,dtbo.img,vbmeta.img} release-files/
