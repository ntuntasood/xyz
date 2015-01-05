class DashboardController < ApplicationController

  include UploadHelper

  def index
  end

  def edit
    c = current_user.creator
    if c and c.active
      @c = current_user.creator
    else
      flash[:alert] = 'uploading must be enabled first'
      redirect_to action: 'index'
    end
  end

  def save
    u = current_user
    c = u.creator

    c.update(description: params[:c][:description])

    unless params[:banner].nil?
      path = creator_upload(u.username, 'banner', params[:banner])
      c.update(banner: path)
    end

    unless params[:icon].nil?
      path = creator_upload(u.username, 'icon', params[:icon])
      c.update(icon: path)
    end

    redirect_to action: 'edit'
  end

  def remove_banner
    c = current_user.creator
    c.update(banner: nil)
    redirect_to action: 'edit'
  end

  def remove_icon
    c = current_user.creator
    c.update(icon: nil)
    redirect_to action: 'edit'
  end

end
