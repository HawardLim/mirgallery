class Exhibition < ActiveRecord::Base
    has_many :arts
    has_many :artists
    has_many :exhi_attachments
    has_many :exhiattachments
end
