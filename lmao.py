
import random

numberOfTransactions = 5
#int(input("Number of trans :"))
accountNumbers= [97684385,83429629,37688799,13622749,32247480,30890160,91452250,74105178,49865825,37720583]

accountTypes = ["Current","Savings"]
typesOfTrans = ["Withdraw","Deposit"]


for i in range(len(accountNumbers)):
  for j in range(numberOfTransactions):
    randomYear = 2022
    randomMonth = 1
    randomDay = random.randrange(1,25)
    timestamp = f"'{randomYear}-{randomMonth}-{randomDay}'"
    amount = random.randrange(-900,900)
    print(f"({accountNumbers[i]},{timestamp},{amount}),")
  