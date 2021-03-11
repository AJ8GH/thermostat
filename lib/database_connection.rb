require 'mongo'

class DatabaseConnection
  class << self
    def setup(dbname)
      self.connection = Mongo::Client.new(['127.0.0.1:27017'], database: dbname)
    end

    def insert(args = {})
      db = connection.database
      settings = db.collections[0]
      settings.insert_one(args)
    end

    private

    attr_accessor :connection

  end
end
