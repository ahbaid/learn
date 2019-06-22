import datetime as dt
import re

# {{{ Start and end dates (inclusive)

#dstart = dt.datetime(2019, 8, 1)
dstart = dt.datetime(2019, 9, 1)

#dend = dt.datetime(2019, 8, 10)
#dend = dt.datetime(2019, 8, 30)
dend = dt.datetime(2019, 9, 30)

# }}}

# {{{ Prepare Calendar Lists, Regular expression strings and parsers

# {{{ Full calendar
dcal_all = []
# }}}

# {{{ All Weekends
dcal_wkends = []
re_wkends = '^.*Sat|Sun.*'
p_wkends = re.compile(re_wkends)
# }}}

# {{{ All Weekdays
dcal_wkdays = []
re_wkdays = '^.*Mon|Tue|Wed|Thu|Fri+.*'
p_wkdays = re.compile(re_wkdays)
# }}}

# {{{ All Maintenance Windows
dcal_mw_all = []
re_mw_all = '^.*Tue|Thu|Sat+.*'
p_mw_all = re.compile(re_mw_all)
# }}}

# {{{ All Maintenance Weekends
dcal_mw_wkends = []
re_mw_wkends = '^.*Sat.*'
p_mw_wkends = re.compile(re_mw_wkends)
# }}}

# {{{ All Maintenance Weekdays
dcal_mw_wkdays = []
re_mw_wkdays = '^.*Tue|Thu.*'
p_mw_wkdays = re.compile(re_mw_wkdays)
# }}}

# }}}

# {{{ Holiday checker
def holiday(dstr):
   re_holidays = '^.*09/05/2019.*'
   p_holidays = re.compile(re_holidays)
   return p_holidays.search(dstr)
# }}}

# {{{ Generate Calendars

d = dstart

# Iteration step - 1 day
daily = dt.timedelta(days=1)


while d <= dend:

   # Reformat date string to expose Day full name (08/01/2019 Thu Aug  1 00:00:00 2019)
   datestr = d.strftime('%m/%d/%Y %c')
   
   # Capture all days
   if holiday(datestr):
      dcal_all.append(datestr+' [HOLIDAY] Labor Day')
   else:
      dcal_all.append(datestr)

   # Capture Weekends
   if p_wkends.search(datestr): dcal_wkends.append(datestr)

   # Capture Weekdays
   if p_wkdays.search(datestr): dcal_wkdays.append(datestr)

   # Capture all Maintenance Windows
   if p_mw_all.search(datestr): dcal_mw_all.append(datestr)

   # Capture all Maintenance Weekends
   if p_mw_wkends.search(datestr): dcal_mw_wkends.append(datestr)

   # Capture all Maintenance Weekdays
   if p_mw_wkdays.search(datestr): dcal_mw_wkdays.append(datestr)

   # Iterate to next day
   d += daily

# }}}

# {{{ Print Calendars

# {{{ Calendar of Days
print('All Days\n================================')
for day in dcal_all: print(day)
print("\n")
# }}}

# {{{ Calendar of Weekends
print('Weekends\n================================')
for day in dcal_wkends: print(day)
print("\n")
# }}}

# {{{ Calendar of Weekdays
print('Weekdays\n================================')
for day in dcal_wkdays: print(day)
print("\n")
# }}}

# {{{ Calendar of Maintenance Days
print('Maintenance days \n================================')
for day in dcal_mw_all: print(day)
print("\n")
# }}}

# {{{ Calendar of Maintenance Weekends
print('Maintenance Weekends\n================================')
for day in dcal_mw_wkends: print(day)
print("\n")
# }}}

# {{{ Calendar of Maintenance Weekdays
print('Maintenance Weekdays\n================================')
for day in dcal_mw_wkdays: print(day)
print("\n")
# }}}

# }}}
