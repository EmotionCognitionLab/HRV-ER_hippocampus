#!/bin/bash
# Execute script via
# bash -x batch.ppfreesurfer.sh

export FREESURFER_HOME="/usr/local/freesurfer_dev/freesurfer"
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export LD_PRELOAD=/usr/local/gcc-7.2.0/lib64/libstdc++.so.6

#source $FREESURFER_HOME/SetUpFreeSurfer.sh
#Free_dev=/usr/local/freesurfer_dev/freesurfer
#PATH=${Free_dev}/bin:${PATH}
#export PATH

basedir=/ifs/loni/groups/matherlab/Users/Hyunjoo/2018_HRVT_MRI_Study/Result/Freesurfer

sublist="5001 5002 5003 5004 5005 5006 5007 5009 5011 5013 5014 5016 5017 5018 5019 5020 5021 5022 5023 5024 5026 5027 5028 5029 5032 5033 5034 5035 5037 5038 5039 5040 5041 5042 5043 5044 5045 5046 5047 5049 5050 5051 5052 5053 5054 5056 5058 5059 5060 5061 5062 5063 6002 6003 6004 6005 6006 6007 6008 6009 6011 6012 6013 6014 6015 6016 6017 6018 6019 6020 6021 6022 6023 6024 6025 6027 6028 6029 6030 6031 6032 6033 6034 6035 6037 6038 6039 6040 6041 6042 6043 6044 6045 6046 6048 6049 6052 6053 6056 6058 7003    7004    7007    7008    7009 7010    7011    7012    7013    7014 7016    7017    7018    7019    7021 7022    7023    7024    7025    7026 7027    7028    7029    7030    7031 7032    8001    8002    8003    8004 8006    8008    8009    8010    8011 8013    8014    8015    8016    8017   8018    8019    8020    8022    8023 8026    8027    8028    8029    8030    8031"
cd ${basedir}
for subID in ${sublist}; do
for session in pre post ; do

cd $basedir/$subID

#fileanat=anat.nii.gz
fileanat=mprage_reoriented.nii.gz

if [ ! -e ${basedir}/${subID}/${session}/mri/lh.amygNucVolumes-T1.v21.txt ]; then
export SUBJECTS_DIR=${basedir}/${subID}
rm ${basedir}/${subID}/${session}/scripts/IsRunningHPsubT1.lh+rh

segmentHA_T1.sh ${session}
#recon-all -s $subj -all
fi
done
done
#tkmedit $subj norm.mgz -segmentation aseg.mgz $FREESURFER_HOME/FreeSurferColorLUT.txt
