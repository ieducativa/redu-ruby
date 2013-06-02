module Redu
  class User < Entity
    attribute :first_name, String
    attribute :last_name, String
    attribute :login, String
    attribute :email, String
    attribute :friends_count, Integer
    attribute :social_networks, Hash
    attribute :localization, String
    attribute :thumbnails, Array[Hash]
    attribute :description, String
    attribute :favorite_quotation, String
    attribute :birthday, Date
    attribute :created_at, DateTime
    attribute :updated_at, DateTime
    attribute :birth_localization, String
    attribute :mobile, String
    attribute :interested_areas, Array[String]
  end
end
