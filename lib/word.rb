class Word
  attr_accessor :id, :title

  @@words = []

  def initialize(title)
    @id = rand(999999)
    @title = title
  end

  def self.all
    @@words
  end

  def self.find(id)
    @@words.select { |word| word.id == id.to_i }.first
  end

  def save
    @@words << self
  end

  def definitions
    Definition.find_by_word_id(self.id)
  end
end
