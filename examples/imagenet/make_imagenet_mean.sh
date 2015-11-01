#!/usr/bin/env sh
# Compute the mean image from the imagenet training lmdb
# N.B. this is available in data/ilsvrc12

EXAMPLE=examples/imagenet
DATA=data/ilsvrc12
TOOLS=.build_release/tools

echo "Creating image mean for Train..."
$TOOLS/compute_image_mean $EXAMPLE/dogs05_ilsvrc12_train_lmdb \
  $EXAMPLE/dogs05_imagenet_mean_train.binaryproto
  
echo "Creating image mean for Validation..."
$TOOLS/compute_image_mean $EXAMPLE/dogs05_ilsvrc12_val_lmdb \
  $EXAMPLE/dogs05_imagenet_mean_val.binaryproto

echo "Done."
