class AlbumTransaction < ApplicationRecord
  belongs_to :library_transaction
  belongs_to :album
end
