require 'spec_helper'
require 'nokogiri'
require_relative '../../../lib/changeful/models/changeful_content'
require_relative '../../../lib/changeful/helpers/view_helpers'

RSpec.describe Changeful::ViewHelpers, type: :helper do
  include Changeful::ViewHelpers

  def create_a_content
    changeful_content :about_us_title, default: 'about us' 
  end

  describe '#changeful_content' do
    context 'Key exists in database' do
      before { create_a_content }

      it 'Retrieve the correct information' do
        result = changeful_content :about_us_title
        expect(result).to eq 'about us'
      end
    end

    context 'Key does not exist in database' do
      # TODO: to create :with_database option
      it 'Create a record' do
        Changeful::Content.delete_all
        expect{ create_a_content }.to change(Changeful::Content, :count).by(1) 
      end
    end

    context 'Given a block' do
      # TODO: Refactor as mock?
      before do
        require 'action_view/buffers'
        def output_buffer; end
        def output_buffer=(a); end
      end
      let(:content) { '<table><tr><td> hello </td></tr></table>' }

      it 'Saves the block as content' do
        result = changeful_content(:about_us_content) { content }
        result = Nokogiri::HTML.parse(result).text
        expect(result).to eq content
      end
    end
  end
end
