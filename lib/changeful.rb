require "changeful/version"
require "changeful/models/changeful_content"
require "changeful/helpers/view_helpers"
require "active_support/lazy_load_hooks"

ActiveSupport.on_load(:action_view) do
    include Changeful::ViewHelpers
end

module Changeful # :nodoc:
  # Your code goes here...
end
