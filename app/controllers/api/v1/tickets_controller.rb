module Api
  module V1
    class TicketsController < ApplicationController
      # GET /api/v1/tickets
      def index
        tickets = Ticket.page(params[:page]).per(20)

        render json: tickets
      end

      # GET /api/v1/tickets/:id
      def show
        ticket = Ticket.find(params[:id])

        render json: ticket
      end

      # POST /api/v1/tickets
      def create
        ticket = Ticket.create!(ticket_params.merge(user_id: 1))

        NotifySlackJob.perform_later(ticket.id)

        render json: ticket, status: :created
      end

      # PATCH /api/v1/tickets/:id
      def update
        ticket = Ticket.find(params[:id])
        ticket.update!(ticket_params)

        render json: ticket
      end

      # DELETE /api/v1/tickets/:id
      def destroy
        ticket = Ticket.find(params[:id])
        ticket.destroy

        head :no_content
      end

      private

      def ticket_params
        params.require(:ticket).permit(
          :title,
          :description,
          :status,
          :priority
        )
      end
    end
  end
end
