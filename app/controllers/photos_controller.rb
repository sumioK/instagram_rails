class PhotosController < ApplicationController
    before_action :authenticate_user!
    
    def new 
        @photo = current_user.photos.new
    end

    def create
        @photo = current_user.photos.new(photo_params)

        if @photo.save
            redirect_to('/')
        else
            render('photos/new')
        end
    end

    private
    
    def photo_params
        params.require(:photo).permit(:caption, :image)
      end

end
