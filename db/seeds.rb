require 'faker'

Dir.chdir(File.dirname(__FILE__))

event_data = Nokogiri::HTML.parse(open("https://www.raceplace.com/city/san-diego-ca/running/"))
event_data.css('div.result__details').each do |item|
    item = Event.create!(
      name: item.at_css('div.result__name > a').text.strip,
      start_time: DateTime.parse(item.at_css('div.result__date-wrap').text.strip),
      location: item.at_css('div.result__location-wrap').text.strip)
end

cities = ["Cardiff-by-the-Sea", "Carlsbad", "Del Mar", "Encinitas", "La Jolla", "Oceanside", "Solana Beach", "Leucadia"]

200.times do
  user = User.create!(first_name: Faker::Name.first_name,
               last_name: Faker::Name.last_name,
               user_name: Faker::Internet.user_name,
               email: Faker::Internet.email,
               password: '123456',
               age: rand(18..65),
               gender: ["male", "female"].sample,
               city: cities.sample,
               state: "CA",
               zipcode: 92008,
               pace: rand(6.00..10.00),
               availability: ["mornings", "evenings", "afternoons"].sample,
               run_pref: ["trail", "road", "beach"].sample,
               buddy_pref: true)
end

titles = ["Lulu Run Club", "Hillside Loop", "Foggy Campgrounds", "Fresh New Kicks", "Hooky on Yoga", "Return to Campgrounds", "Escape from DBC", "Study Break", "TP Sunset Run", "Better than Nothing", "Running from the Sunday Scaries", "Roberto's!", "Movin Shoes", "Mt. Soledad Challenge", "Swami's Beach Run", "Accidental Hills w/ Tiff", "Old Pro's Fun Run", "TGIF Donut Run", "Functional Legs!", "Culture & Big Jenga", "DNF Pannikin", "Pannikin en Fuego", "Still a Lil Cripple", "Pannikin Tomato Party", "Will Climb 4 Margs", "Wings Wednesday", "Tour de Carlsbad", "Struggle in the Park", "Reservoir Loop", "W Side Sunset Run", "Capmgrounds sans Tom", "Run to Bubby's Brunch", "Signs of Life in CP", "Yay Spring!", "Exploring Southie", "Big Loop + Little Loop", "Hangover Helper", "Warmies to Campgrounds", "Lagoon Trails w/ Con", "Leucadia Donut Run", "Tour de Greenway", "Debut of the Christmas Gloves", "Sunday Adventure Run: LJ to PB", "Windy City Exploring", "Sunday Adventure Run: Pt Loma", "Carl Shurz Park", "So Much Mulled Wine", "Morning Struggle", "Shaking out the Mondays", "Rainy Hump Day Shuffle", "Nike Run Club", "Reservoir Dogs + Loop", "Fall Leaves & Lead Legs", "CP Rambling", "Sweating Deep Dish & Booze", "No Wonder that Hurt", "E River Esplanade", "Salvaging a Lazy Sunday", "Humid AF", "Nashville Recovery P1", "Nashville Recovery P2", "W Side Action + Heads!", "Crippled by Hot Yoga", "Pt. Reyes Palomarin Beach - Lake Trail", "Carmel-by-the-Sea Scenic Loop", "SEH Happy Hour Run", "Moonlight to Seaside", "Kelp Obstacle Course", "That Was Rough", "Struggle on the 101", "Swampy Campgrounds", "Uptown Funk", "Red Eye Shake-out", "Cardiff Kook Run", "Sunday Penance", "2XU Pizza Port Run Club", "Fartlek? (aka Chasing Bekki down 101)", "La Jolla Half", "Sand Run Fail", "Mt. Woodson w/ the Homies", "TP Hill Repeats", "Carlsbad Seawall", "Dat Loop", "SSD / Death March", "Tom Lives!", "Running OUTSIDE!", "Sunday Adventure Run: Mission Beach", "Snowy CP Loop", "Coastal Cruise w/ Tiff", "First Trail Wipe-out", "Home from the Beach", "Greenway Tempo", "Pannikin Fam Reunion", "Warmies to Ponto", "Run 4 Sour Beers", "Battery Park Maze", "E River Downtown", "Good Morning NYC", "St. Patty's 10K", "Neighborhood Loops", "E House Run Club", "Lake Hodges w/ the Homies"]

800.times do
  run = Run.create!(title: titles.sample,
              user_id: rand(1..200),
              location: cities.sample,
              date: Faker::Date.backward(365),
              time: Faker::Time.between(DateTime.now - 1, DateTime.now),
              miles: rand(3..20))
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

6000.times do
  kudo = Kudo.create!(user_id: rand(1..200),
               run_id: rand(1..800))
end

props = ["Great run!", "You're so speedy", "Y u so fast", "Good job", "Way to crush it", "Maybe you should lay off the donuts", "Not your best", "I'm coming 4 u", "Y u so slow", "WARFACE", "BC Sucks", "Go BU!", "D group 4 life", "Jogging... soft j?", "Who's Tom?", "I love CP this time of year!", "Raise the bar", "Not accepting mediocrity", "Are you back!?", "Campgrounds again... how original"]

2000.times do
  comment = Comment.create!(
              content: props.sample,
              user_id: rand(1..200),
              run_id: rand(1..800))
end
