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

rm -rf feeds/packages/lang/golang
git clone -b 25.x --single-branch --depth 1 https://github.com/sbwml/packages_lang_golang feeds/packages/lang/golang

rm -rf ./feeds/packages/net/adguardhome
git clone -b Packages --single-branch --depth 1 https://github.com/GruntFish/GPackages

#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git pw-dependencies
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git && mv openwrt-passwall/luci-app-passwall ./ && rm -rf openwrt-passwall
#git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git && mv openwrt-passwall2/luci-app-passwall2 ./ && rm -rf openwrt-passwall2
