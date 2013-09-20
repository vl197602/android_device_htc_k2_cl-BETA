#!/bin/sh

BASE=../../../vendor/htc/totemc2/proprietary
rm -rf $BASE/*

<<<<<<< HEAD
export DEVICE=k2_cl
export VENDOR=htc
./../s4-common/extract-files.sh $@
=======
for FILE in `egrep -v '(^#|^$)' proprietary-files.txt`; do
  DIR=`dirname $FILE`
  if [ ! -d $BASE/$DIR ]; then
    mkdir -p $BASE/$DIR
  fi
  adb pull /system/$FILE $BASE/$FILE
done

./setup-makefiles.sh
>>>>>>> d4d27f0... totemc2: dis-inherit s4-common
