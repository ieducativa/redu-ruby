module Redu
  class User
    include Virtus

    attribute :id, Integer
    attribute :first_name, String
    attribute :last_name, String
    attribute :login, String
    attribute :email, String
    attribute :friends_count, Integer
    attribute :social_networks, Hash
    attribute :localization, String
    attribute :thumbnails, Hash
  end
end
