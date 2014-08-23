class Link
  include Mongoid::Document
  field :given_url, type: String
  field :slug, type: String
  field :clicks, type: Integer, :default => 0
  field :snapshot, type: String
  field :title, type: String
end
