#!/bin/sh
# $1 Revesion,
# $2 Revesion,
# $3 loai app:1 la pax,0 la driver,
# $4 list cac app can build
# PaxPlus CoachCall
# DriverPlus
build_path='/Users/cabzilla/Desktop/BuildApp/'
now="$(date +'%d-%m-%Y')"
lastname='-V'$1'-R'$2'_'$now'.ipa'
project='QUp'
string=$4;
echo $3
if [ $3 -eq 1 ] ; then
cd /Users/cabzilla/Desktop/iOSTeam/QUpV2.0.0/QUp/
else
project='QUpLimo'
cd /Users/cabzilla/Desktop/iOSTeam/QUpV2.0.0/QUp/QUpLimo/
fi
array_app=(${string//:/ })
for i in "${array_app[@]}"
do
echo $i
rm -rf $build_path'build/'$i'.xcarchive'
xcodebuild -scheme $i -workspace $project.xcworkspace clean archive -archivePath $build_path'build/'$i
xcodebuild -exportArchive -exportFormat ipa -archivePath $build_path'build/'$i'.xcarchive' -exportPath $build_path'build/'$i$lastname  -exportProvisioningProfile $i'_Addhoc'
echo 'Copy build/'$i$lastname
cp $build_path'build/'$i$lastname /Volumes/TaxiV2/$i/
echo Done $i$lastname
done

