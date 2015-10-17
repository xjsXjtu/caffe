#!/usr/bin/python

import os

val_ful     = "./val_full.txt"
val_existed = "./val.txt"

val_image_dir = "/mnt/hgfs/ILSVRC2012/ILSVRC2012_img_val/"

with open(val_ful, 'r') as ful:
    with open(val_existed, 'w') as existed:
        for line in ful:
            image = line.split()[0]
            if os.path.exists(os.path.join(val_image_dir, image)):
                print >> existed, line.strip()
                # print  line.strip()

print "Done."
