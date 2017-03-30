# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Time::DATE_FORMATS[:ru_datetime] = "Sent %d.%m.%Y in %k:%M:%S"