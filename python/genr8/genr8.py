import datetime as dt

dstart = dt.datetime(2019, 8, 1)
dend = dt.datetime(2019, 8, 20)
daily = dt.timedelta(days=1)

dcal = []

d = dstart
while d <= dend:
   dcal.append(d.strftime('%m/%d/%Y %c'))
   d += daily

for day in dcal:
   print(day)
