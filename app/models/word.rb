class Word < ActiveRecord::Base
  belongs_to :user
  belongs_to :tag
  
  def as_json(options={})
    if self.tag
      { name: self.name, tag: self.tag.name }
    end
  end

end
