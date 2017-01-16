# gem install activerecord

require 'active_record'
require 'sqlite3'
require 'logger'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'testdb.sqlite3')
ActiveRecord::Base.logger = Logger.new(STDERR)

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.tables.include? 'albums'
    create_table :albums do |table|
      table.column :title,     :string
      table.column :performer, :string
    end
  end

  unless ActiveRecord::Base.connection.tables.include? 'tracks'
    create_table :tracks do |table|
      table.column :album_id,     :integer
      table.column :track_number, :integer
      table.column :title,        :string
    end
  end
end

class Album < ActiveRecord::Base
  has_many :tracks
end

class Track < ActiveRecord::Base
  belongs_to :album
end
