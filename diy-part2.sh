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

git clone -b Packages --single-branch --depth 1 https://github.com/GruntFish/GPackages

rm -rf feeds/packages/net/adguardhome
mv GPackages/openwrt-adguardhome/adguardhome feeds/packages/net/adguardhome

rm -rf feeds/packages/lang/golang
git clone -b 25.x --single-branch --depth 1 https://github.com/GruntFish/packages_lang_golang feeds/packages/lang/golang
