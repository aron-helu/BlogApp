module Api
  module V1
    class CommentsController < ApplicationController
      before_action :authenticate_user!
      def index
        comments = Comment.where(user_id: params[:user_id])
        render json: comments, status: :ok
      end

      def create
        comment = Comment.new(text: params[:comment][:text], post_id:, user_id:)

        if comment.save
          render json: comment, status: :ok
        else
          render json: comment.errors, status: :unprocessable_entity
        end
      end
    end
  end
end
