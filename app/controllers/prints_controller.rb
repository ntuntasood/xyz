class PrintsController < ApplicationController

  include UploadHelper

  def show
    @p = Print.find_by(id: params[:id])
    if not @p
      flash[:alert] = "print #{params[:id]} not found"
      redirect_to controller: 'home', action: 'index'
    end
  end

  def new

    p = Print.create(name: params[:name],
                     description: params[:p][:description],
                     price: params[:price],
                     min_x: params[:x],
                     min_y: params[:y],
                     min_z: params[:z],
                     materials: params[:materials].map(&:inspect).join(', '),
                     color_supported: params[:p][:color_supported],
                     recommended_printers: params[:printers].map(&:inspect).join(', '),
                     resolution: params[:resolution],
                     tolerance: params[:tolerance])

    unless params[:stl].nil?
      path = print_upload(p.id, 'stl', params[:stl])
      p.update(path: path)
    end

    unless params[:image].nil?
      path = print_upload(p.id, 'image', params[:image])
      p.update(picture_zero: path)
    end

    unless params[:image1].nil?
      path = print_upload(p.id, 'image1', params[:image1])
      p.update(picture_one: path)
    end

    unless params[:image2].nil?
      path = print_upload(p.id, 'image2', params[:image2])
      p.update(picture_two: path)
    end

    unless params[:image3].nil?
      path = print_upload(p.id, 'image3', params[:image3])
      p.update(picture_three: path)
    end

    unless params[:image4].nil?
      path = print_upload(p.id, 'image4', params[:image4])
      p.update(picture_four: path)
    end

    unless params[:image5].nil?
      path = print_upload(p.id, 'image5', params[:image5])
      p.update(picture_five: path)
    end

    current_user.creator.prints << p

    flash[:notice] = 'print uploaded successfully'
    redirect_to :controller => 'dashboard', :action => 'upload'

  end

end
