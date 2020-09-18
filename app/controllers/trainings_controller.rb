class TrainingsController < ApplicationController
    def index
      @training = Training.all
    end

    def show
      @training = Training.find(params[:id])
    end

    def new
      @training = Training.new
    end

    def create
      @training = Training.new(training_params)
      if @training.save!
        flash[:success] = "メニューを追加しました"
        redirect_to @training
      else
        flash.notice = "メニューの作成に失敗しました"
        render "new"
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

        def training_params
           params.require(:training).permit(:title, :content).merge(user_id: current_user.id)
        end
end
