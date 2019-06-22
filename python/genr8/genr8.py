import datetime as dt
import re

# {{{ Start and end dates (inclusive)
dstart = dt.datetime(2019, 8, 1)
dend = dt.datetime(2019, 8, 10)
# }}}

# Iteration step - 1 day
daily = dt.timedelta(days=1)

# {{{ Declare lists to hold day calendars (dcals)
dcal_all = []
dcal_weekends = []
dcal_weekdays = []
dcal_maintenance_windows = []
# }}}

# {{{ Regular expression strings and parsers
re_weekends = '^.*Sat|Sun.*'
p_weekends = re.compile(re_weekends)

re_weekdays = '^.*Mon|Tue|Wed|Thu|Fri+.*'
p_weekdays = re.compile(re_weekdays)

re_maintenance_windows_all = '^.*Tue|Thu|Sat.*'
re_maintenance_windows_weekday = '^.*Tue|Thu.*'
# }}}


d = dstart
# {{{ Generate Calendars

while d <= dend:

   # Reformat date string to expost Day full name
   datestr = d.strftime('%m/%d/%Y %c')
   
   # Capture all days
   dcal_all.append(datestr)

   # Capture weekends
   if p_weekends.search(datestr): dcal_weekends.append(datestr)

   # Capture weekdays
   if p_weekdays.search(datestr): dcal_weekdays.append(datestr)

   # Iterate to next day
   d += daily

# }}}

# {{{ Print Calendars

# {{{ Calendar of days
print('All Days\n================================')
for day in dcal_all: print(day)
print("\n")
# }}}

# {{{ Calendar of weekends
print('Weekends\n================================')
for day in dcal_weekends: print(day)
print("\n")
# }}}

# {{{ Calendar of weekdays
print('Weekdays\n================================')
for day in dcal_weekdays: print(day)
print("\n")
# }}}

# }}}
