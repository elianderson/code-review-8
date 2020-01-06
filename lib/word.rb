class Word
  attr_accessor :id, :title

  @@words = []

  def initialize(id, title)
    @id = id
    @title = title
  end

  def self.all
    @@words
  end

  def self.find(id)
    @@words.select { |word| word.id == id }
  end

  def save
    @@word << self
  end

  def delete
    @@study_terms.delete(self.new_word)
  end
end
