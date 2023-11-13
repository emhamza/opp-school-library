#!/usr/bin/env ruby

require_relative 'app'
require_relative 'homepage'

app = App.new
homepage = HomePage.new(app)

homepage.start
