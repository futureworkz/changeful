require 'generator_spec'
require_relative '../../../lib/generators/changeful/model_generator'

describe Changeful::Generators::ModelGenerator, type: :generator do
  destination File.expand_path('../../../tmp', __FILE__)

  before do
    prepare_destination
    run_generator
  end

  it 'model file create properly' do
    assert_file 'app/models/changeful_content.rb'
  end
end
