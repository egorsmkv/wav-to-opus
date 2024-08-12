from glob import glob

import config

opus_files = glob(f'{config.OPUS_DIR}/*.opus')

cmds = []
for opus_file in opus_files:
    filename = opus_file.split("/")[-1].replace(".opus", ".wav")
    cmd = f'{config.OPUSDEC_BIN} --quiet --rate 16000 {opus_file} {config.OPUS_TO_WAV_DIR}/{filename}'
    cmds.append(cmd)

with open(config.BASH_SCRIPT_O2W, 'w') as f:
    f.write('\n'.join(cmds))

print('Done!')
