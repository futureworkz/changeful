require 'active_record'

module Changeful
  class Content < ActiveRecord::Base
    self.table_name = :changeful_contents

    validates :key, :content, :view_type, :file_path, presence: true
    validates :key, uniqueness: { scope: :file_path }
  end
end
