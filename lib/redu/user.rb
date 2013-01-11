module Redu
  class User < Entity
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
