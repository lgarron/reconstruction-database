require "minitest/autorun"
require "timecop"

require_relative "../lib/recondb"

def setup_db
  Sequel.extension :migration
  Sequel::Model.db = Sequel.sqlite
  Sequel::Migrator.apply Sequel::Model.db, "db/migrations"

  [ReconDatabase::Solve, ReconDatabase::Solver, ReconDatabase::Competition, ReconDatabase::Puzzle].each do |model|
    model.db = Sequel::Model.db 
  end
end

setup_db

def fixture(filename)
  File.read("spec/fixtures/#{filename}")
end
