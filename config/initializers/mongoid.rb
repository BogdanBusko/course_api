# module Mongoid::Document
#   def as_json(options = {})
#     attrs = super(options)
#     attrs['id'] = attrs['_id'].to_s
#     attrs
#   end
# end


module BSON
  class ObjectId
    alias :to_json :to_s
    alias :as_json :to_s
  end
end