class Word < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  
  scope :tagged, -> { where("tag_id IS NOT NULL") }
  scope :untagged, -> { where("tag_id IS NULL") }

  def as_json(options={})
    if self.tag
      { name: self.name, tag: self.tag.name }
    end
  end

end
