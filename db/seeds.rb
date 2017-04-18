[User, Event, Ticket, Comment, Category].each do |model|
  ActiveRecord::Base.connection.execute("TRUNCATE #{model.table_name} RESTART IDENTITY CASCADE")
end

mark = User.create!(username: "Mark", email: "look@me.com", image: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAg2AAAAJDUwMjk4YjI0LWI4MjUtNDkwNi04NWVmLTZlYWEzZWU1MzRiNg.jpg", bio: "Legend")
conor = User.create!(username: "Conor", email: "heen@slice", image: "", bio: "Irish Code Monkey")
jack = User.create!(username: "Giacomo", email: "jack@mo", image: "", bio: "Italian Code Monkey")

grad = Event.create!(name: "WDI25 Grad Ball", location: "Black Horse Pub", date: Date.new(2017, 4, 25), description: "Massive knees up", max_tickets: 8, tickets_left: 3, price: 0.00, image: "", video: "", user: conor,  )
organised = Event.create(name: "Piss-up", location: "A Brewery", date: Date.new(2017, 4, 28), description: "Piss-up in a brewery", max_tickets: 8, tickets_left: 7, price: 5.20, image: "", video: "", user: mark)

Ticket.create!(event: grad, user: mark)
Ticket.create!(event: grad, user: conor)
Ticket.create!(event: grad, user: jack)
Ticket.create!(event: organised, user: mark)
Ticket.create!(event: organised, user: conor)
Ticket.create!(event: organised, user: jack)

Comment.create!(event: grad, body: "I bring the partaay!", user: jack)
