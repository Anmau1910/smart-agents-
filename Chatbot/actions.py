from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

import requests
from rasa_core_sdk import Action
from rasa_core_sdk.events import SlotSet

class Consultar(Action):
    def name(self):
        return "consultar"

    def run(self, dispatcher, tracker, domain):
        # type: (Dispatcher, DialogueStateTracker, Domain) -> List[Event]
        termino = tracker.get_slot('concepto')
        '''
        base_url = http://horoscope-api.herokuapp.com/horoscope/{day}/{sign}
        url = base_url.format(**{'day': "today", 'sign': user_horoscope_sign})
        #http://horoscope-api.herokuapp.com/horoscope/today/capricorn
        res = requests.get(url)
        todays_horoscope = res.json()['horoscope']'''
        response = "Tu palabra:\n{}".format(termino)

        dispatcher.utter_message(response)
        return [SlotSet("concepto", termino)]