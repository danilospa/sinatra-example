# frozen_string_literal: true

require './application'
require 'rack/contrib'

Dir.glob('./app/controllers/*.rb').each { |file| require file }

use Rack::PostBodyContentTypeParser
use HealthChecksController
use IssuesController
run Application
