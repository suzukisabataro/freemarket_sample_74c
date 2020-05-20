class ItemImage < ApplicationRecord
  belongs_to :item
<<<<<<< Updated upstream
=======
  mount_uploader :image, ItemImageUploader
>>>>>>> Stashed changes
end
