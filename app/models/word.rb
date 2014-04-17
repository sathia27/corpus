class Word < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  belongs_to :tagged_user, :class_name => User, :foreign_key => :tag_created_by
  
  scope :tagged, -> { where("tag_id IS NOT NULL") }
  scope :untagged, -> { where("tag_id IS NULL") }
  
  validates_uniqueness_of :name
  
  def as_json(options={})
    if self.tag
      { name: self.name, tag: self.tag.name }
    end
  end

end
