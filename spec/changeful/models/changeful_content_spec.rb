require 'spec_helper'
require 'shoulda-matchers'
require_relative '../../../lib/changeful/models/changeful_content'

describe Changeful::Content, type: :model do
  context ' Validation ' do
    it { is_expected.to validate_presence_of :key }
    it { is_expected.to validate_uniqueness_of(:key).scoped_to(:file_path) }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :view_type }
  end
end
