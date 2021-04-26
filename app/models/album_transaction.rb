class AlbumTransaction < ApplicationRecord
  belongs_to :transactions
  belongs_to :album
end
