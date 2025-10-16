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

rm -rf feeds/packages/net/adguardhome

rm -rf feeds/luci/applications/luci-app-passwall


#彻底删除UPNP

sed -i '/CONFIG_PACKAGE.*upnp/d' .config
sed -i '/CONFIG_PACKAGE.*UPNP/d' .config
rm -rf ./feeds/packages/net/u2pnpd
rm -rf ./feeds/packages/net/amule  
rm -rf ./feeds/packages/multimedia/gmediarender
rm -rf ./feeds/packages/multimedia/minidlna
rm -rf ./feeds/packages/net/transmission
rm -rf ./feeds/packages/net/kadnode
rm -rf ./feeds/packages/net/zerotier
rm -rf ./feeds/packages/sound/upmpdcli
rm -rf ./feeds/luci/applications/luci-app-upnp
rm -rf ./feeds/packages/libs/libupnpp
rm -rf ./feeds/packages/libs/libupnp
rm -rf ./feeds/packages/libs/libnpupnp
rm -rf ./feeds/packages/net/miniupnpd
rm -rf ./feeds/packages/net/miniupnpc
rm -rf ./feeds/packages/multimedia/xupnpd

rm -rf feeds/packages/lang/golang
git clone -b 25.x --single-branch --depth 1 https://github.com/GruntFish/packages_lang_golang feeds/packages/lang/golang
