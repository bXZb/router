#!/bin/bash


# Modify default IP
# sed -i 's/192.168.1.1/192.168.100.1/g' package/base-files/files/bin/config_generate

#
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

#
rm -rf package/feeds/luci/luci-theme-argon
rm -rf package/feeds/luci/luci-theme-argon-mod

# luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/feeds/luci/luci-theme-argon

rm package/base-files/files/etc/banner
wget https://raw.githubusercontent.com/bXZb/router/master/depends/banner -O package/base-files/files/etc/banner

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate