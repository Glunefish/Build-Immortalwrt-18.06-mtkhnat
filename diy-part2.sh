#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

rm -rf ./feeds/packages/net/adguardhome
git clone -b master --single-branch --depth=1 https://github.com/coolsnowwolf/packages ./ledepackage
sed -i 's|include \.\./\.\./lang/golang/golang-package\.mk|include \$(TOPDIR)/lang/golang/golang-package.mk|g' ./ledepackage/net/adguardhome/Makefile
mv ./ledepackage/net/adguardhome ./feeds/packages/net/adguardhome
rm -rf ./ledepackage



rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 25.x feeds/packages/lang/golang


git clone https://github.com/GruntFish/luci-app-adguardhome ./package/luci-app-adguardhome
git clone https://github.com/lwb1978/openwrt-gecoosac ./package/openwrt-gecoosac
git clone https://github.com/zzsj0928/luci-app-pushbot ./package/luci-app-pushbot
git clone https://github.com/sirpdboy/luci-app-lucky ./package/luci-app-lucky



#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git pw-dependencies
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git && mv openwrt-passwall/luci-app-passwall ./ && rm -rf openwrt-passwall
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git && mv openwrt-passwall2/luci-app-passwall2 ./ && rm -rf openwrt-passwall2
