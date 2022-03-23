#!/bin/bash
# Execute script via
# bash -x batch.ppfreesurfer.sh

export FREESURFER_HOME="/usr/local/freesurfer-6"
source $FREESURFER_HOME/SetUpFreeSurfer.sh


basedir=/ifs/loni/groups/matherlab/Users/Hyunjoo/2018_HRVT_MRI_Study/Result/Freesurfer

#COMPLETED:9001 9003 9005 9006 9007 9040 9004 4011 4022

cd ${basedir}
for subID in 8016_redo 8022_redo ; do
for session in pre post; do

cd ${basedir}/${subID}
#fileanat=anat.nii.gz
fileanat1=${basedir}/${subID}/pre/mprage_reoriented.nii.gz
fileanat2=${basedir}/${subID}/post/mprage_reoriented.nii.gz
if [ ! -e ${basedir}/${subID}/${session}.long.${subID}_base ]; then
export SUBJECTS_DIR=${basedir}/${subID}
#recon-all -s freesurfer -i ${basedir}/${subID}/${session}/${fileanat} -all
#recon-all -base ${subID}_base -tp pre -tp post -all
echo $subID $session
recon-all -long ${session} ${subID}_base -all
#recon-all -s $subj -all
echo "Done"
fi
done
done
#tkmedit $subj norm.mgz -segmentation aseg.mgz $FREESURFER_HOME/FreeSurferColorLUT.txt
