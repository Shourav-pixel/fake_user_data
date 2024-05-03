class AdminController < ApplicationController
  def home

  end
  def fetch_data
    region = params[:region]
    data = YAML.load_file("#{Rails.root}/config/locales/#{region}.yml")
    render partial: 'table_rows', locals: { data: data }
  end
end