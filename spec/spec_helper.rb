require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'changeful'

require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database => ':memory:'
)
ActiveRecord::Schema.define do
  create_table "changeful_contents", force: :true do |t|
    t.string   "key"
    t.text     "content"
    t.string   "view_type"
    t.string   "file_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
end
