class BoardsController < ApplicationController
    before_action :set_target_board, only: %i[show edit update destroy]

    def index
        @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
        @boards = @boards.page(params[:page])
    end

    def new
        @board = Board.new
    end

    def create
        board = Board.new(board_params)
        if board.save
            flash[:notice] = "投稿が作成されました。"
            redirect_to board
        else
            redirect_to new_board_path, flash: {
                board: board,
                error_messages: board.errors.full_messages
            }
        end
    end

    def show
        @comment = Comment.new(board_id: @board.id)
    end

    def edit
    end

    def update
        @board.update(board_params)
        redirect_to @board, flash: { notice: "投稿が更新されました。"}
    end

    def destroy
        @board.destroy
        redirect_to boards_path, flash: { notice: "投稿が削除されました。"}
    end

    private

    def board_params
        params.require(:board).permit(:person_name, :company_name, :work_place, :body, tag_ids: [])
    end

    def set_target_board
        @board = Board.find(params[:id])
    end
end
