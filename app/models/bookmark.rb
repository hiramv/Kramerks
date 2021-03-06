class Bookmark < ActiveRecord::Base
  belongs_to :user
  # default_scope { order('created_at DESC') }
  scope :order_by_desc_date, lambda { order('created_at DESC') }
  
	validate :url_has_valid_tld

	def url_has_valid_tld
		unless PublicSuffix.valid?(url)
			errors.add(:url, "URL does not end in TLD")
		end
	end
end
