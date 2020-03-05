# frozen_string_literal: true

class PeopleController < ApplicationController
  def index
    get_data
    render json: { request: JSON.parse(@response.body) }
  end

  def frequency_checker
    get_data

    all_data = @response['data']
    all_emails_string = all_data.map { |person| person['email_address'] }.join

    split_characters = all_emails_string.split('')
    final_frequency = split_characters.group_by { |v| v }.map { |key, value| [value.length, key] }.to_h

    render json: { message: final_frequency }
    end

  def get_data
    @response = HTTParty.get(url, headers: { 'Authorization' => "Bearer #{api_key}" })
  end

  def api_key
    api_key = ENV.fetch('SALESLOFT_API_KEY')
  end

  def url
    url = ENV.fetch('SALESLOFT_URL')
  end
end
