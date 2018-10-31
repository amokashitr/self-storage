class SearchController < ApplicationController

  def retrieve_cities_zip
    values = (Address.all.pluck(:city) + Address.all.pluck(:zip)).uniq.flatten.compact
    respond_to do |format|
      format.json {
        render json: { values: values }
      }
    end
  end

end
