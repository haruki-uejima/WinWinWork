class BoardsController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        @boards = current_user.boards.order(created_at: :desc)
        @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
        @boards = @boards.page(params[:page]).order(created_at: :desc)
    end

    def new
        @board = Board.new
    end

    def create
        @board = current_user.boards.new(board_params)

        if @board.save
            redirect_to @board, notice: "投稿が作成されました。"
        else
            render :new
        end
    end

    def show
        @comment = Comment.new(board_id: @board.id)
    end

    def edit
    end

    def update
        @board.update(board_params)
        redirect_to boards_url, notice: "投稿が更新されました。"
    end

    def destroy
        @board.destroy
        redirect_to boards_url, notice: "投稿が削除されました。"
    end

    private

    def board_params
        params.require(:board).permit(:person_name, :company_name, :work_place, :body, tag_ids: [])
    end

    def set_task
        @board = current_user.boards.find(params[:id])
      end

end
