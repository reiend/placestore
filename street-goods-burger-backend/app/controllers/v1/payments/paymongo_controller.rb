# frozen_string_literal: true

# require './app/api/v1/paymongo'
require './app/api/v1/paymongo'

module V1
  module Payments
    # Paymongo Template
    class PaymongoController < ApplicationController
      before_action :authenticate_store_customer!

      # for handling store customer payments through gcash
      def gcash_auth
        if gcash_auth_params[:type] != 'gcash'
          render json: {
            status: '400',
            message: 'type payment should be gcash'
          }
          return
        end

        store_customer = Paymongo.new
        data = {
          attributes: gcash_auth_params
        }

        gcash_auth_info = store_customer.gcash_auth(
          base_url: "#{ENV['PAYMONGO_BASE_URL']}/sources",
          params: data
        )

        render json: {
          data: gcash_auth_info
        }
      rescue ActionController::ParameterMissing => e
        render json: {
          status: 400,
          message: 'parameter missing',
          e: e.message
        }
      end

      # for handling store customer payments
      def payment
        store_customer = Paymongo.new

        data = {
          attributes: payment_params
        }

        payment_info = store_customer.payment(
          base_url: "#{ENV['PAYMONGO_BASE_URL']}/payments",
          params: data
        )

        render json: {
          data: payment_info
        }
      rescue ActionController::ParameterMissing => e
        render json: {
          status: 400,
          message: 'parameter missing',
          e: e.message
        }
      end

      private

      def gcash_auth_params
        params
          .require(:attributes)
          .permit(
            :type,
            :currency,
            :amount,
            redirect: %i[
              success
              failed
            ],
            billing: [
              :name,
              :phone,
              :email,
              { address: %i[
                line1
                line2
                postal_code
                city
                country
              ] }
            ]
          )
      end

      def payment_params
        params
          .require(:attributes)
          .permit(
            :amount,
            :currency,
            :statement_descriptor,
            :description,
            source: %i[
              id
              type
            ]
          )
      end
    end
  end
end
