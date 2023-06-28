#!/bin/bash

# 2022-09-25
#python downloader.py -c "Child speech, kid speaking" -t "csv/balanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"

# 2022-09-26
#python downloader.py -c "Female speech, woman speaking" -t "csv/balanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"
#python downloader.py -c "Children playing" -t "csv/eval_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"
#python downloader.py -c "Children playing" -t "csv/balanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"

#python downloader.py -c "Child speech, kid speaking" -t "csv/eval_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"

# fail
#python downloader.py -c "Child speech, kid speaking" -t "csv/unbalanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"

# 2022-09-28
#python downloader.py -c "Male speech, man speaking" -t "csv/balanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"
#python downloader.py -c "Male speech, man speaking" -t "csv/eval_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"

## 2022-09-29
#python downloader.py -c "Child speech, kid speaking" -t "csv/unbalanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"
#python downloader.py -c "Children playing" -t "csv/unbalanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"

# ## 2022-10-07
# CLASS="Female speech, woman speaking"
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"
# CLASS="Male speech, man speaking"
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data2/kbh/AIG2022/AudioSet"

#unbalanced################################################################################################

# CLASS="Walk, footsteps" # total 1563. fail 232. num_data = 1331. seg
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Car" # total 40978. fail 4254. num_data = 36724. seg
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Motorcycle" # total 7140. fail 711. num_data = 6429. seg
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Bicycle" # total 2838. fail 327. num_data = 2511. seg
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Bus" # total 5171. fail 507. num_data = 4664. seg
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Truck" # total 10807. fail 961. num_data = 9846. seg
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Run" # total 4289. fail 382. num_data = 3907. seg
# python downloader.py -c "${CLASS}" -t "csv/unbalanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

#balanced################################################################################################

# CLASS="Walk, footsteps" 
# python downloader.py -c "${CLASS}" -t "csv/balanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Car" 
# python downloader.py -c "${CLASS}" -t "csv/balanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Motorcycle"
# python downloader.py -c "${CLASS}" -t "csv/balanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Bicycle" 
# python downloader.py -c "${CLASS}" -t "csv/balanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Bus" 
# python downloader.py -c "${CLASS}" -t "csv/balanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Truck" 
# python downloader.py -c "${CLASS}" -t "csv/balanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

# CLASS="Run" 
# python downloader.py -c "${CLASS}" -t "csv/balanced_train_segments.csv" -o "/home/data/jykim/AudioSet"

#eval################################################################################################

CLASS="Walk, footsteps" 
python downloader.py -c "${CLASS}" -t "csv/eval_segments.csv" -o "/home/data/jykim/AudioSet"

CLASS="Car" 
python downloader.py -c "${CLASS}" -t "csv/eval_segments.csv" -o "/home/data/jykim/AudioSet"

CLASS="Motorcycle"
python downloader.py -c "${CLASS}" -t "csv/eval_segments.csv" -o "/home/data/jykim/AudioSet"

CLASS="Bicycle" 
python downloader.py -c "${CLASS}" -t "csv/eval_segments.csv" -o "/home/data/jykim/AudioSet"

CLASS="Bus" 
python downloader.py -c "${CLASS}" -t "csv/eval_segments.csv" -o "/home/data/jykim/AudioSet"

CLASS="Truck" 
python downloader.py -c "${CLASS}" -t "csv/eval_segments.csv" -o "/home/data/jykim/AudioSet"

CLASS="Run" 
python downloader.py -c "${CLASS}" -t "csv/eval_segments.csv" -o "/home/data/jykim/AudioSet"