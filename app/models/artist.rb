class Artist < ActiveRecord::Base
    has_many :arts
    has_many :exhis
    has_many :exhibitions
end
