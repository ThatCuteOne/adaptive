#!/bin/bash

# depends on
# https://codeberg.org/rubl/modman


MODPACK_VERSION=$(cat pack.json | jq -r '.adaptive_version')
echo Building Adaptive $MODPACK_VERSION...
modman export mrpack adaptive $MODPACK_VERSION
echo adding overrides...
zip -r adaptive.mrpack overrides/
mv adaptive.mrpack adaptive-$MODPACK_VERSION.mrpack
echo adaptive-$MODPACK_VERSION.mrpack