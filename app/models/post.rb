require 'securerandom'

class Post < ActiveRecord::Base

  belongs_to :category

end
