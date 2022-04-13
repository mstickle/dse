import random

with open('last_names.txt', 'r') as f:
	last_names = f.read().splitlines()

with open('first_names.txt', 'r') as f:
	first_names = f.read().splitlines()

usersCount = 0
maxIndex = len(first_names) - 1
with open('users.csv', 'w') as f:
	f.write("id,first_name,last_name,fb\n")
	for ln in last_names:
		for k in range(3):
			fn = first_names[random.randrange(maxIndex)]
			f.write("{},{},{},{}\n".format(usersCount, fn, ln, f"{fn}{ln}"))
			usersCount = usersCount + 1

videosCount = 0
with open('videos.csv', 'w') as f:
	f.write("id,video_name\n")
	for vid in range(1000):
		f.write("{},video_{}\n".format(vid, vid))
		videosCount = videosCount + 1

v_list = random.sample(range(videosCount), random.randint(1, 11))
print(v_list)
with open('likes.csv', 'w') as f:
	f.write("user_id,video_id\n")
	for uid in range(usersCount):
		v_list = random.sample(range(videosCount), random.randint(1, 11))
		# likedCount = random.randrange(15)
		# for k in range(likedCount):
		for vid in v_list:
			f.write("{},{}\n".format(uid, vid))

with open('watched.csv', 'w') as f:
	f.write("user_id,video_id\n")
	for uid in range(usersCount):
		likedCount = random.randrange(10)
		for k in range(likedCount):
			vid = random.randrange(videosCount)
			f.write("{},{}\n".format(uid, vid))

login_count = 0
with open('login.csv', 'w') as f:
	f.write("id,user_id\n")
	for uid in range(usersCount):
		for k in range(4):
			f.write("{},{}\n".format(login_count, uid))
			login_count = login_count + 1

s = random.sample(range(videosCount), random.randint(1, 11))
print(s)
with open('suggestions.csv', 'w') as f:
	f.write("id,video_id\n")
	for i in range(login_count):
		# vid = random.randrange(videosCount)
		s = random.sample(range(videosCount), random.randint(1, 11))
		for v in s:
			f.write("{},{}\n".format(i, v))

max_friends = 100
rand_friends = random.sample(range(usersCount), random.randint(1, 11))
print(rand_friends)
with open('friends.csv', 'w') as f:
	f.write('friend_1,friend_2\n')
	for uid in range(usersCount):
		rand_friends = random.sample(range(usersCount), random.randint(1, 7))
		for fr in rand_friends:
			f.write("{},{}\n".format(uid,fr))