# frozen_string_literal: true

class FbWebhookController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    response = params[:"hub.challenge"]
    render json: response, status: 200
  end

  def update
    if params['field'] == 'likes'
      token = ENV['page']
      Campaign.where(token: token).update_all(page_likes: params['value']['page'])
      head :ok
    end
  end
end
