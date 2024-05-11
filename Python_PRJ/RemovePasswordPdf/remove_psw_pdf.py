#remove password PDF

import pikepdf
import tkinter as tk
from tkinter import filedialog
import os

root = tk.Tk()
root.withdraw()

pdf_loc = "C:\Users\.........\folder_with_pdf"

try:
    os.mkdir(pdf_loc)
except OSError as error:
    print(error)
    

pdf_pass = "password"

pdf_path = filedialog.askdirectory()
for filename in os.listdir(pdf_path):
    f = os.path.join(pdf_path, filename)
    if(os.path.isfile(f)):
        pdf_name = os.path.basename(f)
        pdf = pikepdf.open(f,password = pdf_pass)
        print("processing " + pdf_name)
        pdf.save(pdf_loc + '\\' + pdf_name)
    else:
        print(f + "is not a file")

print("files save in " + pdf_loc)
