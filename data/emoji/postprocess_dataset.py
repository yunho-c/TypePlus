import os
import pandas as pd

# # remove images => actually, let's keep them for now
# os.removedirs("./data/emoji/raw/image")

df = pd.read_csv("./data/emoji/raw/full_emoji.csv")

# remove base64-encoded image data
df.drop(
    columns=[
        "Apple",
        "Google",
        "Facebook",
        "Windows",
        "Twitter",
        "JoyPixels",
        "Samsung",
        "Gmail",
        "SoftBank",
        "DoCoMo",
        "KDDI",
    ],
    inplace=True,
)
df.to_csv("./data/emoji/raw/emoji.csv", index=False)
