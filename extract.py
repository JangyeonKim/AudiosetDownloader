"""
    Extract labeled segment from downloaded AudioSet data
"""

import pandas as pd
import librosa as rs
import soundfile as sf

from glob import glob
import os
from tqdm.auto import tqdm
import argparse
from tqdm import tqdm
from multiprocessing import Pool, cpu_count

sr = 16000

parser = argparse.ArgumentParser()
parser.add_argument('--csv', '-c', type=str, required=True)
parser.add_argument('--dir_out','-o', type=str, required=True)
parser.add_argument('--dir_in','-i', type=str, required=True)
args = parser.parse_args()

os.makedirs(args.dir_out,exist_ok=True)

path_csv = args.csv

if not os.path.exists(path_csv) : 
    raise Exception("ERROR:{} not exist".format(path_csv))
name_csv = path_csv.split('/')[-1]
csv = pd.read_csv(path_csv)


def extract(idx):
    id = csv.iloc[idx]["YTID"]
    st = csv.iloc[idx]["start_seconds"]
    ed = csv.iloc[idx]["end_seconds"]
    #print("{} {} {}".format(id,st,ed))

    path = os.path.join(args.dir_in,id+".wav")

    if os.path.exists(path):
        raw = rs.load(path,sr=sr,mono=True)[0]

        st = int(st * sr)
        ed = int(ed * sr)

        data = raw[st:ed]
        sf.write(os.path.join(args.dir_out,id+".wav"),data,sr)

if __name__ == "__main__" : 

    cpu_num = int(cpu_count()/4)

    arr = list(range(len(csv.index)))
    with Pool(cpu_num) as p:
        r = list(tqdm(p.imap(extract, arr), total=len(arr),ascii=True,desc="extracting {}".format(name_csv)))