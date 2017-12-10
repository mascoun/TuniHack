class Block < ApplicationRecord
    belongs_to :block, optional: true
    serialize :data
    before_create :new_hash
    validates :data, presence: true, length: { maximum: 200 }
    validates :index, uniqueness: { scope: :data }

    def Block.createHash(index,timestamp,data,previous_hash)
    	sha = Digest::SHA256.new
	sha.update( index.to_s + timestamp.to_s + data + previous_hash )
	sha.hexdigest
    end

    private
	def new_hash
		@block = Block.where(data: self.data).last
		@previous_hash = (@block.nil?)? "" : @block.blockHash
		self.blockHash = Block.createHash(self.index,self.created_at.strftime('%s'),self.data.join(","),@previous_hash)
	end
end
