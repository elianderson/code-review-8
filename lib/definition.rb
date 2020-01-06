require('pry')
class Definition
  attr_accessor :id, :word_id, :text

  @@definitions = []

  def self.all
    @@definitions
  end

  def initialize(word_id, text)
    @id = rand(5)
    @word_id = word_id
    @text = text
  end

  def self.find(id)
    @@definitions.select { |definition| definition.id == id }.first
  end

  def self.find_by_word_id(word_id)
    @@definitions.select { |definition| definition.word_id == word_id }
  end

  def save
    @@definitions << self
  end
end
