require 'generator_spec'
require_relative '../../../../lib/generators/changeful/models/active_admin_generator'

describe Changeful::Generators::Models::ActiveAdminGenerator, type: :generator do
  destination File.expand_path('../../../../tmp', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'create model file with activeadmin setting' do
    assert_file 'app/admin/changeful_content.rb', /permit_params :content/
  end
end
