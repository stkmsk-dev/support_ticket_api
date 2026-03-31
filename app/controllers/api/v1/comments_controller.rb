module Api
  module V1
    class CommentsController < ApplicationController
      def index
        comments = Comment.where(ticket_id: params[:ticket_id])

        render json: comments
      end

      def create
        comment = Comment.create!(
          ticket_id: params[:ticket_id],
          content: params[:content]
        )

        render json: comment, status: :created
      end
    end
  end
end
