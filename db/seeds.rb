require 'csv'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# # USERS
# users = User.create([{name: 'Sarah', email: 'sarah@email.com'}, {name: 'Luoana', email: 'luoana@email.com'}, {name: 'Ramona', email: 'ramona@email.com'}])

# # HOTELS

# hotels = Hotel.create([{name: 'The Plaza', city: 'NY', country: 'USA', website: 'www.plaza.com', imageurl: 'fasfsafasf'}, {name: 'The Taj', city: 'Delhi', country: 'India', website: 'www.taj.com', imageurl: 'fasfsafasf'},  {name: 'The Oberoi', city: 'Goa', country: 'India', website: 'www.oberoi.com', imageurl: 'fasfsafasf'} ])

# # WISHLISTED HOTELS

# wishlistedHotels = WishlistedHotel.create([{note: 'Beautiful', user_id: 1, hotel_id: 1}, {note: 'Wow', user_id: 2, hotel_id: 2}, {note: 'Incredible', user_id: 3, hotel_id: 3}])


# # CHECKLIST ITEM
# checklistItems = ChecklistItem.create([{ lineitem: 'Is within my price range'}, { lineitem: 'Has availability for my prefered dates'}, {lineitem: 'Offers packages, deals and discounts'}, {lineitem: 'Airport transfer available on request'}, {lineitem: 'Late checkout available'}])


# # USERS CHECKLISTED ITEM
# usersChecklistedItems = UsersChecklistedItem.create([{ wishlisted_hotel_id: 1, checklist_item_id: 1, checked: true}, { wishlisted_hotel_id: 2, checklist_item_id: 2, checked: true}, { wishlisted_hotel_id: 3, checklist_item_id: 3, checked: false} ])






# Hotel.destroy_all
checklistItems = ChecklistItem.create([{ lineitem: 'Is within my price range'}, { lineitem: 'Has availability for my prefered dates'}, {lineitem: 'Offers packages, deals and discounts'}, {lineitem: 'Airport transfer available on request'}, {lineitem: 'Late checkout available'}])


csv_text = File.read(Rails.root.join('db', 'seeds', 'mod_5_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  puts row['name']
  t = Hotel.new
  t.name = row['name']
  t.city = row['city']
  t.country = row['country']
  t.website = row['website']
  t.imageurl = "https://res.cloudinary.com/#{Rails.application.secrets.cloudinary_user}/image/upload/w_#{800}/q_#{75}/v1549291218/travelbug/#{t.name}_#{t.city}.jpg".gsub(" ","_")
  t.save
  puts "#{t.name} saved"
end
