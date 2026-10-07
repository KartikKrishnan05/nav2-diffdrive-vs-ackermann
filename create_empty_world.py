from PIL import Image
import numpy as np

# Create a white image (e.g., 400x400 pixels)
size = (400, 400)  # adjust size as needed
img = Image.fromarray(np.full(size, 254, dtype=np.uint8))  # 254 = free space
img.save("empty_world.pgm")
