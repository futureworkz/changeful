require_relative '../models/changeful_content'
require 'action_view/helpers/output_safety_helper'
require 'action_view/helpers/capture_helper'

module Changeful
  # The Changeful ViewHelpers expose the methods to be used in view 
  # to make the static content editable
  module ViewHelpers
    include ActionView::Helpers::CaptureHelper
    include ActionView::Helpers::OutputSafetyHelper
    # Returns a content based on a key and store in the database if it does not exist
    #
    # @example
    #   changeful_content(:about_us_title) 
    #   changeful_content(:about_us_title, default: 'About Us')
    #   changeful_content(:about_us_title, default: 'About Us', type: :plain) 
    #
    #   cc :about_us_title
    #   cc :about_us_title, default: 'About Us'
    #   cc :about_us_title, default: 'About Us', type: :plain
    #
    # @param key [Symbol] A unique key in the view file to be referenced
    # @param options [Hash] Additional configuration options (refer below)
    # @option options [Symbol] :default It sets the default content to return if the key is not found in database
    # @option options [Symbol] :type Specify the type of input to be displayed in the backend. Accepted types are :plain, :html
    # 
    # @return [String] a content based on a key
    def changeful_content(key, options = {})
      current_view.present? ? contents ||= Content.all_contents_in(current_view) : raise 

      if contents.present?
        contents.each do |datum|
          return raw(datum.content) if datum.key == key.to_s
        end
      end

      content   = options.delete(:default) || capture(&proc)
      view_type = options.delete(:type)    || :plain
      Content.create!(key: key, 
                      content: content, 
                      view_type: view_type, 
                      file_path: current_view)

      return content
    end

    alias_method :cc, :changeful_content

    private

    def current_view
      caller.each do |stack|
        if stack.include?('/views/')
          return stack[/\/views\/[^.]+/].sub '/views/', ''
        end
      end
    end
  end
end
