require 'data_mapper'
require 'dm-postgres-adapter'
# require_relative 'data_mapper_setup.rb'
# require 'spec_helper'
# require './app/app'

class Link
  include DataMapper::Resource

  has n, :tags, through: Resource

  property :id, Serial
  property :title, String
  property :url, String

end

# data_mapper_setup
