class StorageUnitsController < ApplicationController
  before_action :set_storage_unit, except: %i[index new filter]
  before_action :load_storage_units, only: %i[index filter]

  def new
    @storage_unit = StorageUnit.new
  end

  def create
    @storage_unit = StorageUnit.new(storage_unit_params)
    @storage_unit.save
  end

  def show
    @units = @storage_unit.units
  end

  def update
    @storage_unit.update_with_images(params[:image_ids], storage_unit_params)
    @storage_unit.update_amenities(params[:amenity_ids])
  end

  def destroy
    @storage_unit.destroy
  end

  def filter
    return @storage_units unless (params[:amenities].present? || params[:sort_by].present? || params[:unit_size].present?)
    if params[:sort_by].present?
      @storage_units = (params[:sort_by] == 'rating') ? @storage_units.order(rating: :desc)
                                                      : @storage_units.order(params[:sort_by])
    end
    if params[:unit_size].present?
      size = params[:unit_size].split('X')
      @storage_units = @storage_units.unit_size(size[0], size[1])
    end
    if params[:amenities].present?
      storage_units = []
      params[:amenities].each do |amenity|
        storage_units << @storage_units.associated_amenities(amenity)
      end
      @storage_units = storage_units.inject(:&)
    end
    @storage_units = @storage_units.uniq
  end

  private

    def set_storage_unit
      @storage_unit = StorageUnit.find(params[:id])
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
