# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Blog::Application.initialize!
Time::DATE_FORMATS[:post] = "%d/%m/%Y às %H:%M"
