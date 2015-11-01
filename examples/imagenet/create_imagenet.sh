#!/usr/bin/env sh
# Create the imagenet lmdb inputs
# N.B. set the path to the imagenet train + val data dirs

if [ $# -ne 1 ] ; then 
    echo "./create_imagenet.sh num"
    echo "    num: "
    echo "         1 : create lmdb for training set."
    echo "         2 : create lmdb for validation set."
    exit 1
fi

EXAMPLE=examples/imagenet
DATA=data/ilsvrc12
TOOLS=.build_release/tools

TRAIN_DATA_ROOT=/home/jxion/git_caffe/data/ilsvrc12/dogs_train/
VAL_DATA_ROOT=/home/jxion/git_caffe/data/ilsvrc12/dogs05_val/

# Set RESIZE=true to resize the images to 256x256. Leave as false if images have
# already been resized using another tool.
RESIZE=true
if $RESIZE; then
  RESIZE_HEIGHT=256
  RESIZE_WIDTH=256
else
  RESIZE_HEIGHT=0
  RESIZE_WIDTH=0
fi

if [ ! -d "$TRAIN_DATA_ROOT" ]; then
  echo "Error: TRAIN_DATA_ROOT is not a path to a directory: $TRAIN_DATA_ROOT"
  echo "Set the TRAIN_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet training data is stored."
  exit 1
fi

if [ ! -d "$VAL_DATA_ROOT" ]; then
  echo "Error: VAL_DATA_ROOT is not a path to a directory: $VAL_DATA_ROOT"
  echo "Set the VAL_DATA_ROOT variable in create_imagenet.sh to the path" \
       "where the ImageNet validation data is stored."
  exit 1
fi


if [ $1 -eq 1 ]; then
    echo "Creating dogs05 train lmdb..."

    GLOG_logtostderr=1 $TOOLS/convert_imageset \
        --resize_height=$RESIZE_HEIGHT \
        --resize_width=$RESIZE_WIDTH \
        --shuffle \
        $TRAIN_DATA_ROOT \
        $EXAMPLE/dogs05_train.txt \
        $EXAMPLE/dogs05_ilsvrc12_train_lmdb
fi


if [ $1 -eq 2 ]; then
    echo "Creating dogs05 val lmdb..."

    GLOG_logtostderr=1 $TOOLS/convert_imageset \
        --resize_height=$RESIZE_HEIGHT \
        --resize_width=$RESIZE_WIDTH \
        --shuffle \
        $VAL_DATA_ROOT \
        $EXAMPLE/dogs05_val.txt \
        $EXAMPLE/dogs05_ilsvrc12_val_lmdb
fi

echo "Done."
