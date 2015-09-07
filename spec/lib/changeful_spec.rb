require 'spec_helper'
require_relative '../../lib/changeful.rb'

describe Changeful::ViewHelpers do
  it 'should load Changeful::ViewHelpers' do
    ActiveSupport.run_load_hooks(:action_view)
    result = changeful_content :about_us_header, default: 'about us'
    expect(result).to eq 'about us'
  end
end
