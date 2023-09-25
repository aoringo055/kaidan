class HorrorsController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :create]
    
   

    def index
        if params[:search] != nil && params[:search] != ''
            search = params[:search]
        @horrors = Horror.joins(:user).where("title LIKE ? OR sentence LIKE ?", "%#{search}%", "%#{search}%")
      else
        @horrors = Horror.all
        end
     end
    
    def top
    end

    def junji
    end

    def rock
    end

    def yamayu
    end

    def senka
    end

    def yuki
    end


    def new
        @horror = Horror.new
      end
    
      def create
        horror = Horror.new(horror_params)

        horror.user_id = current_user.id    

        if horror.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @horror = Horror.find(params[:id])
      end
    
      def edit
        @horror = Horror.find(params[:id])
      end

      def update
        horror = Horror.find(params[:id])
        if horror.update(horror_params)
          redirect_to :action => "show", :id => horror.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        horror = Horror.find(params[:id])
        horror.destroy
        redirect_to action: :index
      end

      private
      def horror_params
        params.require(:horror).permit(:title, :sentence, tag_ids: [])
      end
    
  end