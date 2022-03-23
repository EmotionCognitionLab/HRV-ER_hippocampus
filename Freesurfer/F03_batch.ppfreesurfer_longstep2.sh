#!/bin/bash
# Execute script via
# bash -x batch.ppfreesurfer.sh

export FREESURFER_HOME="/usr/local/freesurfer-6"
source $FREESURFER_HOME/SetUpFreeSurfer.sh


basedir=/ifs/loni/groups/matherlab/Users/Hyunjoo/2018_HRVT_MRI_Study/Result/Freesurfer



cd ${basedir}
for subID in 8016_redo 8022_redo ; do
cd ${basedir}/${subID}
if [ -e ${basedir}/${subID}/${subID}_base/error.log ]; then
rm -r ${subID}_base
echo ${subID}_base "removed"
fi
done
#for session in pre post; do
cd ${basedir}
for subID in * ; do
cd ${basedir}/${subID}

#fileanat=anat.nii.gz
fileanat1=${basedir}/${subID}/pre_mprage_reoriented.nii.gz
fileanat2=${basedir}/${subID}/post_mprage_reoriented.nii.gz

if [ ! -e ${basedir}/${subID}/${subID}_base ]; then
echo ${subID}
export SUBJECTS_DIR=${basedir}/${subID}
#recon-all -s freesurfer -i ${basedir}/${subID}/${session}/${fileanat} -all
recon-all -base ${subID}_base -tp pre -tp post -all
#recon-all -s $subj -all
fi
#done
done

