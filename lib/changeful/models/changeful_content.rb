require 'active_record'

module Changeful
  class Content < ActiveRecord::Base
    self.table_name = :changeful_contents

    validates :key, :content, :view_type, presence: true
    validates :key, uniqueness: true
  end
end
