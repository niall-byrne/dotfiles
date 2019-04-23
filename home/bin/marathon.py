#!/usr/bin/python

import datetime

marathon = datetime.datetime(2019, 10,20, 9,00,00,00)
now = datetime.datetime.now()
training_start = marathon - datetime.timedelta(weeks=20)

print("Days Until Marathon: %s") % (marathon - now).days
print("Training Start Date: %s") % training_start.strftime('%Y-%m-%d')
