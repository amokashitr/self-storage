class StorageUnitsController < ApplicationController
  before_action :set_storage_unit, except: %i[index new]
  before_action :load_storage_units, only: %i[index filter]

  def new
    @storage_unit = StorageUnit.new
  end

  def create
    @storage_unit = StorageUnit.new(storage_unit_params)
    @storage_unit.save
  end

  def update
    @storage_unit.update_with_images(params[:image_ids], storage_unit_params)
    @storage_unit.update_amenities(params[:amenity_ids])
  end

  def destroy
    @storage_unit.destroy
  end

  def filter
    return @storage_units unless params[:filters].present?
    storage_units = []
    params[:filters].each do |filter|
      storage_units << @storage_units.associated_amenities(filter)
    end
    @storage_units = storage_units.inject(:&)
  end

  private

    def set_storage_unit
      @storage_unit = StorageUnit.where(id: params[:id]).first
    end

    def storage_unit_params
      params.require(:storage_unit).permit(:name, :about, :contact_no, images:[],
                                            address_attributes: [:id, :city, :state, :street, :zip, :_destroy])
    end

    def load_storage_units
      @storage_units = params[:city_zip].present? ? StorageUnit.city_zip(params[:city_zip])
                                                  : StorageUnit.all
    end

end
