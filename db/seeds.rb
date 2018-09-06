EventCategory.create!([
  {name: "Konkatsu", description: "Konkatsu events"},
  {name: "Koikatsu", description: "Koikatsu events"},
  {name: "Gourmet", description: "Gourmet themed events"}
])
Event.create!([
  {title: "Nice Konkatsu Event", location: "銀座", start_at: "2020-03-28 09:00:00", ticket_price: 5000, ticket_quantity: 30, event_category_id: 1},
  {title: "Great Koikatsu Event", location: "渋谷", start_at: "2020-04-05 09:00:00", ticket_price: 4000, ticket_quantity: 25, event_category_id: 2},
  {title: "Gourmet Themed Event", location: "渋谷", start_at: "2020-03-13 14:36:00", ticket_price: 6000, ticket_quantity: 35, event_category_id: 3}
])
