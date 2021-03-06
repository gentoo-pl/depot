class UploadController < ApplicationController
  def get
  	@picture = Picture.new
  end

  def save
  	@picture = Picture.new(params[:picture])

  	if @picture.save
  		redirect_to action: 'show', notice: "PIcture added", id: @picture
  	else
  		render :get
  	end
  end

  def picture
  	@picture = Picture.find params[:id]
  	send_data(@picture.data, filename: @picture.name, type: @picture.content_type, disposition: "inline")
  end


  def show
  	@picture = Picture.find params[:id]
  end
end
