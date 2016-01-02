from datetime import datetime

now = datetime.now()
current_year = now.year
current_month = now.month
current_day = now.day

print now
print current_year
print current_month
print current_day

print '%s-%s-%s' % (now.year, now.month, now.day)
print '%s:%s:%s' % (now.hour, now.minute, now.second)



















