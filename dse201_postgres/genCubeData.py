import random

def main():
	nrOfCategs = 50
	nrOfProds = 100

	# customers
	with open('last_names.txt', 'r') as f:
		last_names = f.read().splitlines()

	with open('first_names.txt', 'r') as f:
		first_names = f.read().splitlines()

	with open('state_names.txt', 'r') as f:
		states = f.read().splitlines()

	with open('state_abbrevs.txt', 'r') as f:
		abbrevs = f.read().splitlines()

	with open('states.csv', 'w') as f:
		f.write("id,state,abbrev\n")
		for i, (s, a) in enumerate(zip(states, abbrevs)):
			f.write("{},{},{}\n".format(i, s, a))


	custCount = 0
	maxIndex = len(first_names) - 1
	max_state = len(states) - 1
	with open('customers.csv', 'w') as f:
		f.write("id,first_name,last_name,state_id\n")
		for ln in last_names:
			# for k in range(1):
			fn = first_names[random.randrange(maxIndex)]
			state_id = random.randrange(max_state)
			f.write("{},{},{},{}\n".format(custCount, fn, ln, state_id))
			custCount = custCount + 1

	# categs
	with open('categories.csv', 'w') as f:
		f.write("id,cname,cdescr\n")
		for cid in range(nrOfCategs):
			f.write("{},C{},Products in this category have properties PSET{}\n".format(cid,cid,cid))


	# products
	with open('products.csv', 'w') as f:
		f.write("id,pname,price,cid\n")
		for pid in range(nrOfProds):
			dollars = random.randrange(1000)
			cents = random.randrange(100)
			if dollars == 0 and cents == 0:
				cents = 13
			cid = random.randrange(nrOfCategs)
			f.write("{},P{},{}.{},{}\n".format(pid,pid,dollars,cents,cid))

	# sales
	with open('sales.csv', 'w') as f:
		f.write("id,pid,cid,quantity,discount\n")
		sid = 1
		for cid in range(custCount):
			boughtCnt = random.randrange(5)
			for k in range(boughtCnt):
				quantity = random.randrange(1000)
				discount = random.randrange(100)/100.0
				pid = random.randrange(nrOfProds-1)
				f.write("{},{},{},{},{}\n".format(sid,pid,cid,quantity,discount))
				sid = sid + 1			

if __name__ == '__main__':
	main()