# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

storage_units = []

storage_units[0] = StorageUnit.create(name: 'Delk Road Self Storage', contact_no: '(678) 903-1171', rating: '5', about: 'Delk Road Self Storage is located on Powers Ferry Place SE in Marietta, GA. With great move-in specials, pick Delk Road Self Storage for your self storage needs')

storage_units[1] = StorageUnit.create(name: 'Life Storage - Atlanta - Tilly Mill Road', contact_no: '(678) 903-1171', rating: '5', about: 'Life Storage offers a wide selection of storage units with a choice of both traditional and premium storage environments.')

storage_units[2] = StorageUnit.create(name: 'Pleasantdale Storage of Doraville', contact_no: '(404) 631-6264', rating: '5', about: 'Lock in your low rate. Theres no risk - easily cancel or change your reservation at any time.')

storage_units[3] = StorageUnit.create(name: 'CubeSmart Self Storage - Lithia Springs - 1575 North Blairs Bridge Road', contact_no: '(855) 284-7016', rating: '5', about: 'CubeSmart Self Storage is committed to providing our customers with excellent products, facilities, and customer service. Our customers enjoy many perks including moving services, packing & shipping supplies, storage customization, and business services - along with the best discounts in the industry!')

storage_units[4] = StorageUnit.create(name: 'Ark Self Storage - Marietta', contact_no: '(678) 903-1171', rating: '4.5', about: 'Welcome to Ark Self Storage of Marietta, GA! We take the worry out of self storage. Ark Self Storage is a gated facility with surveillance cameras and electronic gate access. Our monthly rates are low and insurance is available for additional peace of mind. Your unit is accessible 24/7 and our on-site manager is available to assist you with your storage needs.')

storage_units[5] = StorageUnit.create(name: 'A 85 Riverdale Storage', contact_no: '(855) 284-7016', rating: '4.5', about: '-One Stop UHaul and Storage. Climate Controlled and Regular Storage. Indoor Storage & Outdoor Car, Truck, RV, Boat Parking. Residential & Commercial Storage. Locks, Boxes & Moving Supplies. Video Surveillance/Electronic Security & Gate. Resident Manager. Fenced & Lighted. Month to Month Rental. Tenant Insurance Available. Serves Riverdale, Forest Park, Atlanta, College Park, East Point, Stockbridge. After-Hour Storage Reservation')

storage_units[6] = StorageUnit.create(name: 'Simply Self Storage - Decatur, GA- Ponce De Leon Ave', contact_no: '(404) 631-6264', rating: '4.5', about: 'Founded in 2003, Simply Self Storage has grown to become one of the largest privately owned self storage management companies in the United States and Puerto Rico. With over 230 locations across the States, we provide customers with easy access, convenience, and personal communication to make the self storage experience a positive one.')

storage_units[7] = StorageUnit.create(name: 'Space Shop Self Storage - Lenox', contact_no: '(404) 631-6264', rating: '4.5', about: 'Space Shop brings you a best-in-class storage experience with affordable units to fit every budget. Our small, 5X5 lockers are ideal for student storage due to our proximity to Emory University. Climate-controlled 10X10 units are designed to meet a wide variety of household, business, and student storage needs. From decluttering and home staging projects to business records storage we have the perfect-sized unit to meet your needs. Our large, 10X20 and 10X30 climate-controlled storage units will hold the contents of medium and large households as well as excess business inventory and equipment. Moreover, sought-after storage features and competitive prices make our storage features hard to beat.')

storage_units[8] = StorageUnit.create(name: 'Ark Self Storage - Smyrna', contact_no: '(855) 284-7016', rating: '4', about: 'Ark Self Storage of Smyrna, GA is a gated, non climate controlled, facility with surveillance cameras and electronic gate access. We offer low monthly rates and insurance is available. Your unit is accessible 24/7 and our on-site manager is available to assist you during business hours. We offer both indoor and outdoor units to suit your individual storage needs.')

storage_units[9] = StorageUnit.create(name: 'StoreSmart - Riverdale', contact_no: '(855) 284-7016', rating: '4', about: 'Lock in your low rate. Theres no risk - easily cancel or change your reservation at any time.')

addresses = [
              {street: '6305 Church St', city: 'Riverdale', state: 'GA', zip: '30274'},
              {street: '5152 Austell Rd', city: 'Austell', state: 'GA', zip: '30106'},
              {street: '3150 Austell Rd SW', city: 'Marietta', state: 'GA', zip: '30008'},
              {street: '5985 S Norcross Tucker Rd', city: 'Norcross', state: 'GA', zip: '30093'}
            ]

count = 0
StorageUnit.all.each do |storage_unit|
  address_hash = addresses[(count % 4)]
  storage_unit.address = Address.create(street: (address_hash[:street].to_s), 
                                        city: (address_hash[:city].to_s),
                                        state: (address_hash[:state].to_s),
                                        zip: (address_hash[:zip].to_s)
                                        )
  count += 1
end

amenities = []
amenities[0] = Amenity.create(category: 'ACCESS', feature: 'Electronic gate access')
amenities[1] = Amenity.create(category: 'ACCESS', feature: 'Handcarts available')
amenities[2] = Amenity.create(category: 'ACCESS', feature: '24-hour access')

amenities[3] = Amenity.create(category: 'ADMINISTRATION', feature: 'Admin fee: $20.00')
amenities[4] = Amenity.create(category: 'ADMINISTRATION', feature: 'Accepts mail/packages for tenants')

amenities[5] = Amenity.create(category: 'MOVING', feature: 'Truck rental available')
amenities[6] = Amenity.create(category: 'MOVING', feature: 'Moving supplies for sale')

amenities[7] = Amenity.create(category: 'BILLING', feature: 'Email billing available')
amenities[8] = Amenity.create(category: 'BILLING', feature: 'Rent due on 1st of each month')
amenities[9] = Amenity.create(category: 'BILLING', feature: 'Auto-pay available')
amenities[10] = Amenity.create(category: 'BILLING', feature: 'Credit cards accepted: Visa, Mastercard, AMEX, Discover')


storage_units[0].amenities = [amenities[2], amenities[0], amenities[1], amenities[5]]
storage_units[1].amenities = [amenities[5], amenities[2], amenities[10], amenities[6]]
storage_units[2].amenities = [amenities[3], amenities[1], amenities[9], amenities[8]]
storage_units[3].amenities = [amenities[2], amenities[10], amenities[1], amenities[6]]
storage_units[4].amenities = [amenities[4], amenities[0], amenities[1], amenities[3]]
storage_units[5].amenities = [amenities[7], amenities[8], amenities[10], amenities[4]]
storage_units[6].amenities = [amenities[4], amenities[2], amenities[10], amenities[5]]
storage_units[7].amenities = [amenities[1], amenities[3], amenities[9], amenities[2]]
storage_units[8].amenities = [amenities[6], amenities[4], amenities[5], amenities[1]]
storage_units[9].amenities = [amenities[8], amenities[6], amenities[2], amenities[10]]

units = Hash.new
for i in 0..9
  for j in 0..7
    units[[i,j]] = storage_units[i].units.create(length: (5 * rand(1..4)), breadth: (5 * rand(1..4)), quantity: rand(1200..2000), rate: rand(300..4000), offer: '15% Off and First Month Free')
    
    rand_amenities = [0,1,2,3,4,5,6,7,8,9,10].sort{ rand() - 0.5 }.take(4)
    
    units[[i,j]].amenities = [
                              amenities[rand_amenities[0]], amenities[rand_amenities[1]],
                              amenities[rand_amenities[2]], amenities[rand_amenities[3]]
                             ]
  end
end

StorageUnit.all.each do |storage_unit|
  image1 = rand(1..10).to_s
  image2 = rand(11..20).to_s
  storage_unit.images.attach(io: File.open('./app/assets/images/' + image1 + '.jpg'), filename: image1 + '.jpg')
  storage_unit.images.attach(io: File.open('./app/assets/images/' + image2 + '.jpg'), filename: image2 + '.jpg')
end

Unit.all.each do |unit|
  image = 'u' + rand(1..6).to_s
  unit.images.attach(io: File.open('./app/assets/images/' + image + '.png'), filename: image + '.png')
end