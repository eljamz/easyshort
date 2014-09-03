class Link
  include Mongoid::Document

  field :given_url, type: String
  field :slug, type: String
  field :clicks, type: Integer, :default => 0
  field :snapshot, type: String
  field :title, type: String
  field :user_id, type: String

  # Relations
  belongs_to :user

  # Actions
  after_create :generate_slug

  # Create constant. Advice thanks to "Milan Dobrota ‏@milandobrota"
  ALPHANUMERIC_VALUE = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten


  def generate_slug
    # Generate random first letter or number
    random_init  =  (0...1).map{ ALPHANUMERIC_VALUE[rand(ALPHANUMERIC_VALUE.length)]  }.join

    # Start with the url id
    char = self.id.to_s

    # Run some validations
    if char.length > 10
      char = char.to_i + Time.now.to_i + rand(1...100)
      char = random_init.to_s + char.to_s(30)
    else
      char = char * 343
      char = char.to_i + Time.now.to_i + rand(1...100)
      char = random_init.to_s + char.to_s(16)
    end

    # Generate result
    random_slug = char

    # Save the slug
    self.slug = random_slug
    self.save
  end




  def display_slug
    "http://easyshort.com/" + self.slug.to_s
  end


end
