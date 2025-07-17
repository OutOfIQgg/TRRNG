# TRRNG

# TRRNG is short for Totally Realistic Random Number Generator.

## it's stupid. it's pointless. but at least it does something.

- trng.a is for "advanced" functions and calculations. made by ChatGPT.

- trng.b is for "basic" functions and calculations. made entirely by OutOfIQ (me)

- trng.e is for "expermental" functions and calculations. 1 was made by ChatGPT (trng.e.grn()), 1 was made by me (trng.e.cf())

---

1. trng.a/b/e.grn(min. max, mloops)

  - min = your minimum number

  - max = your maximum number

  - mloops = how many times it should run

  - how it works: it creates a new value called "gn" (generated number) which is placed randomly on
              your given minmum to your given maximum. and then it counts up and down until
              another variable called "loops" reaches the "mloops"'s value and then returning
              the final value of "gn" value. which is your final number.

  -  pros: uses 2 PRNG methods (love.math.random() and the count up and down), usefull to not get exploited easily. 

  - cons: pointless, love.math.random() could do the same.

---

2. trng.a/b/e.cf(bool)

  - bool = the boolean you wanna coin flip into either true or false

  - how it works: in trng.b: love.math.random(1, 10) if it's 5 or below, it's false. if it's 6 or beyond, it's true.
              in trng.a: math.
              in trng.e: kinda like trng.b.grn(min, max, mloops)

  - pros: idk

  - cons: idk

pls support me on ko-fi (if you can. even $1 is more than enough). I had to wake up 7 more braincells and too many hours to count.

THIS PLUGIN IS STILL IN ALPHA STAGES UNTIL ANY AND ALL GLITCHES ARE RESOLVED
