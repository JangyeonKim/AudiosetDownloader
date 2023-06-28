import pandas as pd
# import youtube_dl as ydl
import yt_dlp as ydl
import argparse
import os


class MyLogger(object):
    def debug(self, msg):
        print(msg)

    def warning(self, msg):
        print(msg)

    def error(self, msg):
        print(msg)

def my_hook(d):
    """
    if d['status'] == 'finished':
        print('Done downloading, now converting ...')
    elif d['status'] == 'downloading' :
        return
        if 'total_bytes' in d :
            pass#print("Downloading : " + str(round( (d['downloaded_bytes'] / d['total_bytes'] )* 100 , 2) ) + "%")
        else :
            pass#print("Downloading : But couldn't get total_bytes" 
    """
    pass



"""
    Extract target class info from data
    if path_out == None : 
        save with default file name into "output" directory
    e.g
    target_class = "Children_playing"
    path_target_csv = "./csv/unbalanced_train_segments.csv"
    patH_out = "Children_playing_from_unbalanced_train.csv"
"""
def extract_target_class_list(
    target_class,
    path_target_csv,
    path_out=None, 
    path_class="./csv/class_labels_indices.csv") : 

    csv_class = pd.read_csv(path_class)

    # Extract mid
    mid = csv_class.loc[csv_class["display_name"]==target_class]["mid"].values[0]

    # Target CSV
    csv_eval = pd.read_csv(
    path_target_csv,
        names=["YTID", "start_seconds","end_seconds", "positive_labels"],
        skipinitialspace = True,
        comment="#",
    )
    name_target = path_target_csv.split("/")[-1]
    id_target = name_target.split(".")[0]

    # Extract rows with min
    df_found = csv_eval.query('positive_labels.str.contains("{}")'.format(mid))

    # save extracted csv
    df_found.to_csv(os.path.join("extracted","{}_{}.csv".format(target_class,id_target)))

    # return list of Youtube ID
    return list(df_found["YTID"])

if __name__=="__main__" : 
    parser = argparse.ArgumentParser()
    parser.add_argument('--target_class', '-c', type=str, required=True)
    parser.add_argument('--target_csv','-t', type=str, required=True)
    parser.add_argument('--dir_out','-o', type=str, required=True)
    args = parser.parse_args()

    list_id = extract_target_class_list(args.target_class,args.target_csv)

    name_target = args.target_csv.split("/")[-1]
    id_target = name_target.split(".")[0]

    os.makedirs(os.path.join(args.dir_out,args.target_class),exist_ok=True)

    ydl_opts = {
        'prefer_ffmpeg':True,
        'format': 'bestaudio/best',
        'outtmpl':'{}/{}/%(id)s.%(ext)s'.format(args.dir_out,args.target_class),
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'wav',
            'preferredquality': '192',

        }],
        'quiet':True,
        'logger': MyLogger(),
        'progress_hooks': [my_hook],
    }

    cnt_togo = len(list_id)
    cnt_fail = 0
    cnt = 0
    for id in list_id :
        print("[LOG] {:.2f}% {} / {} | fail {} | {} | {} | {}".format((cnt+cnt_fail)/len(list_id) * 100,cnt+cnt_fail,len(list_id),cnt_fail,id,args.target_class,id_target ))
        try : 
            if not os.path.exists(os.path.join(args.dir_out,args.target_class,id+".wav")) : 
                with ydl.YoutubeDL(ydl_opts) as y:
                    y.download(["https://youtu.be/{}".format(id)])
        except ydl.utils.DownloadError as e: 
            cnt_fail+=1
            print(e)
            continue
        except AttributeError as e: 
            print(e)
            cnt_fail+=1
            continue
        cnt+=1
