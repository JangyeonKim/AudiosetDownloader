#!/bin/bash

# class="Walk, footsteps"
# class="Motorcycle"
# class="Bicycle"
class="Car"
# class="Bus"
# class="Truck"
# class="Run"

# for csv in "${class}_balanced_train_segments.csv" "${class}_eval_segments.csv" "${class}_unbalanced_train_segments.csv";
for csv in "${class}_eval_segments.csv";
do
    # python extract.py -c "./extracted/${csv}" -i "/home/data2/kbh/AIG2022/AudioSet/${class}/" -o "/home/data2/kbh/AIG2022/AudioSet/${class}_seg/"
    python extract.py -c "./extracted/${csv}" -i "/home/data/jykim/AudioSet_eval/${class}/" -o "/home/data/jykim/valid/eval/${class}_seg/"
done