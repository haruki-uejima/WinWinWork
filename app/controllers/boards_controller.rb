class BoardsController < ApplicationController
    before_action :set_target_board, only: %i[show edit update destroy]

    def index
        @boards = Board.page(params[:page])
    end

    def new
        @board = Board.new
    end

    def create
        board = Board.create(board_params)
        flash[:notice] = "新規作成しました。"
        redirect_to board
    end

    def show
    end

    def edit
    end

    def update
        @board.update(board_params)

        redirect_to @board
    end

    def destroy
        @board.delete
        redirect_to boards_path, flash: { notice: "投稿が削除されました。"}
    end

    private

    def board_params
        params.require(:board).permit(:person_name, :company_name, :work_place, :body)
    end

    def set_target_board
        @board = Board.find(params[:id])
    end
end
