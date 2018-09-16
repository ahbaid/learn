import subprocess
proc = subprocess.Popen(['ls','-l'], shell=True, stdout=subprocess.PIPE)
rc=proc.wait()

for line in proc.stdout():
   print(line)
