from glob import glob

import config

wav_files = glob(f'{config.WAV_DIR}/*.wav')

cmds = []
for wav_file in wav_files:
    filename = wav_file.split("/")[-1].replace(".wav", ".opus")
    cmd = f'{config.OPUSENC_BIN} --quiet --speech --vbr --raw-chan 1 --raw-rate 16000 {wav_file} {config.OPUS_DIR}/{filename}'
    cmds.append(cmd)

with open(config.BASH_SCRIPT_W2O, 'w') as f:
    f.write('\n'.join(cmds))

print('Done!')
