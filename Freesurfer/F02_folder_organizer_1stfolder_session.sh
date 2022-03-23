#!/bin/bash

#This script copies the files from "freesurfer" folder to "session" folder in each sub ID and removes the uncecessary subfolder "freesurfer" under session folder. If not, the next script shows error.
dataDIR=/ifs/loni/groups/matherlab/Users/Hyunjoo/2018_HRVT_MRI_Study/Result/Freesurfer
scriptDIR=/ifs/loni/groups/matherlab/Users/Hyunjoo/2018_HRVT_MRI_Study/scripts/Freesurfer


task=MPRAGE
cd ${dataDIR}

for subID in 8022_redo ; do
for session in pre ; do
inddataDIR=${dataDIR}/${subID}/${session}
if [ -e ${inddataDIR} ]; then

cp -r ${dataDIR}/${subID}/freesurfer/* ${inddataDIR}
rm -r ${inddataDIR}/freesurfer/


fi
done
done
