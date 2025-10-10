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

git clone https://github.com/xiaoqingfengATGH/luci-theme-infinityfreedom ./package/luci-theme-infinityfreedom
git clone https://github.com/lwb1978/openwrt-gecoosac ./package/openwrt-gecoosac
git clone https://github.com/zzsj0928/luci-app-pushbot ./package/luci-app-pushbot

git clone https://github.com/GruntFish/OP-Packages ./package/OP-Packages
git clone https://github.com/sirpdboy/luci-app-lucky ./package/luci-app-lucky
git clone https://github.com/sirpdboy/luci-app-watchdog ./package/luci-app-watchdog
