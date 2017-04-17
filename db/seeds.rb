[User, Event, Ticket].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

mark = User.create!(username: "Mark", email: "look@me.com", image: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAg2AAAAJDUwMjk4YjI0LWI4MjUtNDkwNi04NWVmLTZlYWEzZWU1MzRiNg.jpg", bio: "Really cool guy")
conor = User.create!(username: "Conor", email: "heen@slice", image: "", bio: "Irish Code Monkey")
jack = User.create!(username: "Giacomo", email: "jack@mo", image: "", bio: "Italian Code Monkey")


grad = Event.create!(name: "WDI25 Grad Ball", date: Date.new(2017, 4, 25), location: "Black Horse, Leman Street, London", user: mark, max_tickets: 8, tickets_left: 3, price: 0.00)
pubbing = Event.create(name: "Piss-up", date: Date.new(2017, 4, 28), location: "A Brewery", max_tickets: 8, tickets_left: 7, price: 5.20, user: conor)

Ticket.create!(event: grad, user: mark)
Ticket.create!(event: grad, user: conor)
Ticket.create!(event: grad, user: jack)
Ticket.create!(event: pubbing, user: mark)
Ticket.create!(event: pubbing, user: conor)
Ticket.create!(event: pubbing, user: jack)
