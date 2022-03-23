#!/bin/bash
# Execute script via
# bash -x batch.ppfreesurfer.sh

export FREESURFER_HOME="/usr/local/freesurfer-6"
source $FREESURFER_HOME/SetUpFreeSurfer.sh


basedir=/ifs/loni/groups/matherlab/Users/Hyunjoo/2018_HRVT_MRI_Study/Result/Freesurfer

#COMPLETED:9001 9003 9005 9006 9007 9040 9004 4011 4022

cd ${basedir}
#sub_list="5030 5031 6047 6050 6051 6054 6055 6057"
sub_list="5030 5031"
for subID in 8022_redo  ; do


for session in pre; do

cd ${basedir}/${subID}

#fileanat=anat.nii.gz
fileanat=mprage_reoriented.nii.gz
#if [ -e ${basedir}/${subID}/post_${fileanat} ]; then
if [ ! -e ${basedir}/${subID}/${session}/stats/aseg.stats ]; then
export SUBJECTS_DIR=${basedir}/${subID}
#recon-all -s ${session}  -all -no-isrunning
recon-all -s ${session} -i ${basedir}/${subID}/${session}_${fileanat} -all
#recon-all -s ${session} -i ${basedir}/${subID}/${session}/${fileanat} -all
#recon-all -s $subj -all
fi
#fi
done

done
#tkmedit $subj norm.mgz -segmentation aseg.mgz $FREESURFER_HOME/FreeSurferColorLUT.txt
