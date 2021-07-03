#!/bin/sh

#  myScript.sh
#  ZYCreditApp
#
#  Created by CYZ on 2021/6/2.
#  Copyright © 2021 chiyz. All rights reserved.
#exit
# chmod u+x ***用于添加权限
# Type a script or drag a script file from your workspace to insert its path.
TARGET_APP_PATH="${SRCROOT}/nuhuoyidao.app"                           #需要拷贝的目标应用
BUILD_APP_PATH="$BUILT_PRODUCTS_DIR/$TARGET_NAME.app"               #build生成的应用
 
#签名所有framework和动态库
function codesign(){
    for file in `ls $1`;
    do
		extension="${file#*.}"
        if [[ -d "$1/$file" ]]; then
			if [[ "$extension" == "framework" ]]; then
        			/usr/bin/codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" "$1/$file"
			else
				codesign "$1/$file"
			fi
		elif [[ -f "$1/$file" ]]; then
			if [[ "$extension" == "dylib" ]]; then
        			/usr/bin/codesign --force --sign "$EXPANDED_CODE_SIGN_IDENTITY" "$1/$file" --no-strict --deep
        	fi
        fi
    done
}
 
#删除原目录
rm -rf "$BUILD_APP_PATH" || true
mkdir -p "$BUILD_APP_PATH" || true
 
#拷贝目标应用替换build生成的应用
cp -rf "$TARGET_APP_PATH/" "$BUILD_APP_PATH/"
 
 mkdir -p "$BUILD_APP_PATH/Frameworks" || true
# 拷贝渠道动态库
cp -a "$BUILT_PRODUCTS_DIR/MYDylib.framework" "$BUILD_APP_PATH/Frameworks" || true
#删除PlugIns和Watch
rm -rf "$BUILD_APP_PATH/PlugIns" || true
rm -rf "$BUILD_APP_PATH/Watch" || true
 
codesign "$BUILD_APP_PATH"
