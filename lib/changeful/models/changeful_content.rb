require 'active_record'

module Changeful
  class Content < ActiveRecord::Base
    self.table_name = :changeful_contents

    validates :key, :content, :view_type, :file_path, presence: true
    validates :key, uniqueness: { scope: :file_path }

    scope :all_contents_in, ->(current_view) { where('file_path = ?', current_view) }
  end
end
