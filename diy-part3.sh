#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part3.sh
# Description: OpenWrt DIY script part 3 (After Update feeds)
#

sed -i 's/0x2B2/0x312/g' target/linux/ramips/patches-5.10/322-mt7621-fix-cpu-clk-add-clkdev.patch

sed -i 's|/luci-static/bootstrap|/luci-static/infinityfreedom|g' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

sed -i 's/192.168.1.1/192.168.10.254/g' package/base-files/files/bin/config_generate

NEW_PASSWORD_HASH=$(openssl passwd -1 "admin.123")
sed -i "s|root::0:0:99999:7:::|root:${NEW_PASSWORD_HASH}:0:0:99999:7:::|" package/base-files/files/etc/shadow
