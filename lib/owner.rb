class Owner

attr_reader :name, :species, :say_species

@@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a #{species}."
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|d| d.owner == self}
  end

  def buy_cat(new_cat)
    Cat.new(new_cat, self)
  end

  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end

  def walk_dogs
    #Dog.mood = "happy"
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

    def feed_cats
      self.cats.each do |cat|
        cat.mood = "happy"
      end
    end

    def sell_pets
      self.cats.each do |cat|
        cat.mood = "nervous"
        cat.owner = nil
      end
      self.cats.clear
      self.dogs.each do |dog|
        dog.mood = "nervous"
        dog.owner = nil
      end
      self.dogs.clear
    end
    
    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end

  
end