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

  Event.create( name: 'Event 1',
                start_date: '2014-02-01',
                end_date: '2014-02-02',
                url: 'www.event1.com')

  Event.create( name: 'Event 2',
                start_date: '2014-02-01',
                end_date: '2014-02-02',
                url: 'www.event2.com')
  
end