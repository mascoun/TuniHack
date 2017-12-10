module BlockHelper
  def block_prepare(obj,data)
	@block = Block.new(data: data)
	if @block.save
	   obj.blockHash = @block.blockHash
	   obj.save
	   if obj.instance_of? User
	   	@users = User.where(hospital_id: obj.hospital_id,approved: true).where.not(id: obj.id).shuffle.last(6);
	   elsif obj.instance_of? Hospital
	   	@users = User.where(approved: true).shuffle.last(6);		
	   else
	   	@users = User.where(hospital_id: obj.hospital_id,approved: true).shuffle.last(6);
	   end
  	   @users.each do |user|
		@question = Question.new(object: obj.class.name,id_object: obj.id,user_id: user.id)
		@question.save
	   end
	end
  end
  def nextBlock(obj)
	@oldBlock = Block.find_by(blockHash: obj.blockHash)
	@block = Block.new(index: @oldBlock.index+1,data: @oldBlock.data)
	if @block.save
	   if @block.index == 4 then
		obj.approved = true
	   end
	   obj.blockHash = @block.blockHash
	   obj.save
	   @block
	else
	   nil
	end
  end
end
