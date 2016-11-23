Dir.chdir(File.dirname(__FILE__))

event_data = Nokogiri::HTML.parse(open("https://www.raceplace.com/city/san-diego-ca/running/"))
event_data.css('div.result__details').each do |item|
    item = Event.create!(
      name: item.at_css('div.result__name > a').text.strip,
      start_time: DateTime.parse(item.at_css('div.result__date-wrap').text.strip),
      location: item.at_css('div.result__location-wrap').text.strip)
end

tide_data = Nokogiri::XML(File.open("tide_data.xml"))
tide_data.xpath('//item').each do |item|
    item = Tide.create!(date: item.xpath('date').text,
      time: item.xpath('time').text,
      day: item.xpath('day').text,
      predictions_in_ft: item.xpath('predictions_in_ft').text,
      predictions_in_cm: item.xpath('predictions_in_cm').text,
      highlow: item.xpath('highlow').text)
end



user1 = User.create!(first_name: "Tiffany",
               last_name: "Chappell",
               user_name: "runwithtiff",
               email: "tippyc@gmail.com",
               password: '123456',
               age: 30,
               gender: "female",
               city: "Del Mar",
               state: "CA",
               zipcode: 92014,
               pace: 7.00,
               availability: "evenings",
               run_pref: "beach",
               buddy_pref: true)

user2 = User.create!(first_name: "Bekki",
               last_name: "Early",
               user_name: "bekkidarling",
               email: "bearly@gmail.com",
               password: '123456',
               age: 35,
               gender: "female",
               city: "San Marcos",
               state: "CA",
               zipcode: 92078,
               pace: 7.00,
               availability: "evenings",
               run_pref: "beach",
               buddy_pref: true)

user3 = User.create!(first_name: "James",
               last_name: "Li",
               user_name: "speedyli",
               email: "jli@gmail.com",
               password: '123456',
               age: 35,
               gender: "male",
               city: "Escondido",
               state: "CA",
               zipcode: 92029,
               pace: 7.00,
               availability: "evenings",
               run_pref: "beach",
               buddy_pref: true)

titles = ["Lulu Run Club", "Hillside Loop", "Movin Shoes Meetup", "Mt. Soledad Challenge", "Swami's Beach Run", "Old Pro's Fun Run", "TGIF Donut Run", "Tour de Carlsbad", "Reservoir Loop", "W Side Sunset Run", "Run to Bubby's Brunch", "Exploring Southie", "Big Loop + Little Loop", "Lagoon Trails w/ Con", "Tour de Greenway", "Sunday Adventure Run: LJ to PB", "Carl Shurz Park", "Nike Run Club", "Reservoir Dogs + Loop", "E River Esplanade", "Pt. Reyes Palomarin Beach - Lake Trail", "Carmel-by-the-Sea Scenic Loop", "Cardiff Kook Run", "2XU Pizza Port Run Club", "La Jolla Half", "TP Hill Repeats", "Carlsbad Seawall", "Snowy CP Loop", "Greenway Tempo", "St. Patty's 10K", "Neighborhood Loops", "E House Run Club"]

cities = ["Cardiff-by-the-Sea", "Carlsbad", "Del Mar", "Encinitas", "La Jolla", "Oceanside", "Solana Beach", "Leucadia", "San Marcos", "Escondido"]

30.times do
  run = Run.create!(title: titles.sample,
              user_id: rand(1..200),
              location: cities.sample,
              date: DateTime.backward(365),
              time: DateTime.between(DateTime.now - 1, DateTime.now),
              miles: rand(3..20))
end

40.times do
  kudo = Kudo.create!(user_id: rand(1..10),
               run_id: rand(1..20))
end

props = ["Great run!", "Speedy!", "Good job", "Maybe you should lay off the donuts", "Not your best", "Go BU!", "D group 4 life", "Jogging... soft j?", "Raise the bar", "Not accepting mediocrity"]

20.times do
  comment = Comment.create!(
              content: props.sample,
              user_id: rand(1..10),
              run_id: rand(1..20))
end
