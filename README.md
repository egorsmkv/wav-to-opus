# `wav-to-opus`

- Parallelized script to convert all `.wav` files in a directory to `.opus` files using `opusenc`.
- Parallelized script to convert all `.opus` files in a directory to `.wav` files using `opusdec`.

## Encode

```shell
python wav_to_opus.py

cat wav_to_opus.sh | parallel -j 6
```

## Decode

```shell
python opus_to_wav.py

cat opus_to_wav.sh | parallel -j 6
```
