# init repo
repo init -u https://github.com/yaap/manifest.git -b sixteen --git-lfs --depth=1

# clone device stuff
git clone https://github.com/grepfox/local_manifest -b yaap .repo/local_manifests

# sync rom
repo sync -j$(nproc --all) --no-tags --no-clone-bundle --current-branch

# clone and displayfeatures
rm -rf packages/apps/DisplayFeatures
git clone https://github.com/yaap/packages_apps_DisplayFeatures packages/apps/DisplayFeatures

# Signing keys
rm -rf vendor/yaap/signing/keys
git clone https://github.com/grepfox/yaap_sign vendor/yaap/signing/keys

# setup build env
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
