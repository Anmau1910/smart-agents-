from rasa_nlu.training_data import load_data 
from rasa_nlu.model import Trainer
from rasa_nlu import config
from rasa_nlu.model import Interpreter

def train_blockchainbot(data, conf, modl):
	training_data = load_data(data)
	trainer = Trainer(config.load(conf))
	trainer.train(training_data)
	model_directory = trainer.persist(modl, fixed_model_name = 'botchain')