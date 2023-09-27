#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# kernel
sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' target/linux/x86/Makefile
sed -i 's/KERNEL_TESTING_PATCHVER:=5.15/KERNEL_TESTING_PATCHVER:=6.1/g' target/linux/x86/Makefile

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> "feeds.conf.default"
echo "src-git passwall https://github.com/xiaorouji/openwrt-passwall.git;main" >> "feeds.conf.default"

# luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git package/tmp
mv package/tmp/luci-app-openclash package/
rm -rf package/tmp/
