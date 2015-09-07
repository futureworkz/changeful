require 'generator_spec'
require_relative '../../../lib/generators/changeful/install_generator'

describe Changeful::Generators::InstallGenerator, type: :generator do
  destination File.expand_path('../../../tmp', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'migration file created properly' do
    assert_migration 'db/migrate/create_changeful_contents.rb', /def change/
  end
end
