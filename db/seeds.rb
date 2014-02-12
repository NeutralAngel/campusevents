if Rails.env.development?

  Attendee.delete_all
  Subscription.delete_all
  Event.delete_all
  Sponsor.delete_all
  Meeting.delete_all
  Location.delete_all

  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='attendees';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='subscriptions';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='events';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='sponsors';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='meetings';")
  ActiveRecord::Base.connection.execute("delete from sqlite_sequence where name='locations';")

  Event.create(name: 'End of the World', start_date: '2014-03-18', end_date: '2014-03-19',
               url: 'www.vogons.com')
  Event.create(name: 'Krikkit Attack on the Galaxy', start_date: '2014-02-01', end_date: '2014-02-02',
               url: 'www.killeverybody.com')
  
  Sponsor.create(name: 'Prosser Enterprises', logo: 'logo', url: 'www.prosser.com', 
                 events: [Event.find_by(name: 'End of the World')] )
  Sponsor.create(name: 'Vogons', logo: 'logo', url: 'www.vogons.com', 
                 events: Event.all )
  Sponsor.create(name: 'The Board of Judges', logo: 'logo', url: 'www.livr.gov', 
                 events: [Event.find_by(name: 'Krikkit Attack on the Galaxy')] )

  Location.create(name: 'Milliways', description: 'The Restaurant at the End of the Universe', 
    latitude: -24.116949, longitude: 152.716224, map_url: 'https://www.google.com/maps/place/Lady+Elliot+Island+Reef/@-24.1125844,152.7145119,15z/data=!3m1!4b1!4m2!3m1!1s0x6be936941e90f547:0x4f77be8277d06262')
  Location.create(name: "Arthur's House", description: "The House of Dent", latitude: 50.900292,
                  longitude: -3.493533, map_url: 'https://www.google.com/maps/@50.900292,-3.493533,3a,75y,199.08h,90t/data=!3m4!1e1!3m2!1semrqxfyYbx9I8CrbzMCc3g!2e0')

  Meeting.create(name: 'March of Progress', description: 'Building a Bypass', 
                 start_time: '2014-03-18 16:00:00', end_time: '2014-03-18 18:00:00',
                 location: Location.find_by(name: "Arthur's House"),
                 event: Event.find_by(name: 'End of the World'))
  Meeting.create(name: 'End of Time', description: 'The End of History itself!', 
                 start_time: '2014-03-18 14:00:00', end_time: '2014-03-18 15:00:00',
                 location: Location.find_by(name: 'Milliways'),
                 event: Event.find_by(name: 'End of the World'))
  Meeting.create(name: 'Campaign For Real Time', description: 'Improbability Physics 101', 
                 start_time: '2014-02-01 16:00:00', end_time: '2014-02-01 18:00:00',
                 location: Location.find_by(name: "Arthur's House"),
                 event: Event.find_by(name: 'Krikkit Attack on the Galaxy'))
  Meeting.create(name: 'Intergalactic Election', description: 'Rigged, duh.', 
                 start_time: '2014-02-02 16:00:00', end_time: '2014-02-02 18:00:00',
                 location: Location.find_by(name: 'Milliways'),
                 event: Event.find_by(name: 'Krikkit Attack on the Galaxy'))

  Attendee.create(first_name: 'Arthur', last_name: 'Dent', email: 'adent@oldjanxspirit.com',
                  events: Event.all)
  Attendee.create(first_name: 'Ford', last_name: 'Prefect', email: 'fprefect@thgttg.org',
                  events: [Event.find_by(name: 'Krikkit Attack on the Galaxy')])
  Attendee.create(first_name: 'Zaphod', last_name: 'Beeblebrox', email: 'zbeeblebrox@imperialgalactic.gov')

  Subscription.create(attendee: Attendee.find_by(id: 3), event: Event.find_by(id: 1))
end
