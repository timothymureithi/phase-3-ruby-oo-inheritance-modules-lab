require 'pry'
require_relative './concerns/memorable'
require_relative './concerns/findable'
require_relative './concerns/paramable'

class Song
  attr_accessor :name
  attr_reader :artist
  extend Memorable::ClassMethods
  extend Findable::ClassMethods
  extend Paramable 

  @@songs = []

  def initialize
    @@songs << self
  end

  def self.all
    @@songs
  end

  def artist=(artist)
    @artist = artist
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
