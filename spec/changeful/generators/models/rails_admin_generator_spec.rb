require 'generator_spec'
require_relative '../../../../lib/generators/changeful/models/rails_admin_generator'

describe Changeful::Generators::Models::RailsAdminGenerator, type: :generator do
  destination File.expand_path('../../../../tmp', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'model file with rails admin setting create properly' do
    assert_file 'app/models/changeful_content.rb', /rails_admin do/
  end
end
