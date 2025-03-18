import kagglehub
import os

# Download latest version
path = kagglehub.dataset_download("subinium/emojiimage-dataset")

os.rename(path, "./data/emoji/raw")
