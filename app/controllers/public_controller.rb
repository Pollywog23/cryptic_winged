class PublicController < ApplicationController
  
  def index  
     @galleries = Galleries.where(:published => true).order(:created_at => 'DESC').limit(6)
  end

  def blog

  end

end
