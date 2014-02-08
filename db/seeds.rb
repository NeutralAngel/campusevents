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

  Event.create(name: 'Event1', start_date: '2014-02-01', end_date: '2014-02-02',
               url: 'www.event1.com')
  Event.create(name: 'Event2', start_date: '2014-02-01', end_date: '2014-02-02',
               url: 'www.event2.com')
  
  Sponsor.create(name: 'Sponsor1', logo: 'logo', url: 'www.url.com', 
                 events: [Event.find_by(name: 'Event2')] )
  Sponsor.create(name: 'Sponsor2', logo: 'logo', url: 'www.url.com', 
                 events: [Event.find_by(name: 'Event1')] )
  Sponsor.create(name: 'Sponsor3', logo: 'logo', url: 'www.url.com', 
                 events: Event.all )

  Location.create(name: 'Location1', description: 'description', latitude: 4.123456,
                  longitude: 12.345678, map_url: 'www.thisbeit.com')
  Location.create(name: 'Location2', description: 'description2', latitude: 4.123456,
                  longitude: 12.345678, map_url: 'www.thisbeit2.com')

  Meeting.create(name: 'Meeting1', description: 'description1', 
                 start_time: '2014-02-06 16:00:00', end_time: '2014-02-06 18:00:00',
                 location: Location.find_by(name: 'Location1'),
                 event: Event.find_by(name: 'Event1'))
  Meeting.create(name: 'Meeting2', description: 'description2', 
                 start_time: '2014-02-06 16:00:00', end_time: '2014-02-06 18:00:00',
                 location: Location.find_by(name: 'Location2'),
                 event: Event.find_by(name: 'Event2'))

  Attendee.create(first_name: 'Nathan', last_name: 'Nontell', email: 'nnontell@iupui.edu',
                  events: Event.all)
  Attendee.create(first_name: 'Julianne', last_name: 'Nontell', email: 'test@test.com',
                  events: [Event.find_by(name: 'Event2')])
  Attendee.create(first_name: 'Tom', last_name: 'Bobadil', email: 'tbombadil@test.com')

  Subscription.create(attendee: Attendee.find_by(id: 3), event: Event.find_by(id: 1))
end
