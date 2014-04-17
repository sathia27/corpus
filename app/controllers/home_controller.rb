class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:rank]

  def index
    render "index"
  end

  def rank
    grouped_users = Word.includes(:tagged_user).tagged.group_by(&:tagged_user).collect { |user,word| { "UID - #{user.id.to_s}, #{user.to_s}" => word.count } if user }
    @ranks = Hash[*grouped_users.collect{|h| h.to_a}.flatten].sort_by {|k,v| v}.reverse
  end
end
