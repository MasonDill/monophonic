import argparse as ap
import os as os
import sys as sys
TRAIN_PATH = "/tf-end-to-end/ctc_training.py"
PRIMUS_PATH = "/primus_data"
DATA_SET = "/tf-end-to-end/Data/train.txt"
VOCABULARY = "/tf-end-to-end/Data/vocabulary_semantic.txt"
SAVE_MODEL = "/models"
#python ctc_training.py -semantic -corpus <path_to_PrIMuS> -set Data/train.txt -vocabulary Data/vocabulary_semantic.txt  -save_model ./trained_semantic_model
#python ctc_training.py -corpus <path_to_PrIMuS> -set Data/train.txt -vocabulary Data/vocabulary_agnostic.txt -save_model ./trained_agnostic_model
os.system("python " +TRAIN_PATH+" -semantic -corpus "+PRIMUS_PATH+" -set "+DATA_SET+" -vocabulary "+VOCABULARY+" -save_model "+SAVE_MODEL)
