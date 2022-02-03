print "Creating Reviews..."

Review.destroy_all

r1 = Review.create! title: 'Porco Rosso: the best ghibli film', rating:'just cos'
r2 = Review.create! title: 'test review', rating:'test test'
r3 = Review.create! title: 'Best coder in sei50', rating:"obviously alex, he's so handsome and cool omg"

puts "created #{Review.count} reviews"

####################################################


print "Creating Users..."

User.destroy_all

u1 = User.create! email: 'calicoalix@gmail.com', username: 'CAL1CO', password: 'chicken'
u2 = User.create! email: 'ro@ga.co', username: 'browena', password: 'chicken'

u1.reviews << r1 << r2
u2.reviews << r3

puts "User #{User.first.username} created"
puts "User #{User.second.username} created"

puts "Testing user -< review associations:"
puts "","• the review '#{Review.first.title}' is by #{Review.first.user.username}",""
puts "• the User #{User.first.username} has the reviews: #{User.first.reviews.pluck(:title).join(', ')}",""

####################################################


print "Creating Lists..."

List.destroy_all

l1 = List.create! title: 'My reviews'
l2 = List.create! title: 'Cool reviews'

l1.reviews << r1 << r2
l2.reviews << r3 << r2
l1.users << u1 
l2.users << u2 << u1
# u1.lists << l1 << l2
# u2.lists << l3 << l2

puts "List #{List.first.title} created"
puts "List #{List.second.title} created"

puts "Testing List >-< review associations:"
puts "","• the list '#{l2.title}' is by user/s #{l2.users.pluck(:username).join(', ')}",""
puts "• the User #{User.first.username} has the lists: #{User.first.lists.pluck(:title).join(', ')}",""