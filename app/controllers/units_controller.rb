class UnitsController < ApplicationController

  before_action :set_storage_unit
  before_action :set_unit, except: %i[index new filter]

  def index
    @units = @storage_unit.units.paginate(page: params[:page], per_page: 5)
  end

  def new
    @unit = @storage_unit.units.new
  end

  def create
    @unit = @storage_unit.units.new(unit_params)
    @unit.save
  end

  def update
    @unit.update_with_images(params[:image_ids], unit_params)
    @unit.update_amenities(params[:amenity_ids])
  end

  def destroy
    @unit.destroy
  end

  def filter
    @units = []
    if params[:amenity].present?
      units = @storage_unit.units.all.associated_amenities(params[:amenity])
    end
    units ||= @storage_unit.units.all
    if params[:size].present?
      units.all.each do |unit|
        if unit.size == params[:size]
          @units << unit
        end
      end
      @units = @units.paginate(page: params[:page], per_page: 5)
    else
      @units = units.paginate(page: params[:page], per_page: 5)
    end
  end

  private

    def set_unit
      @unit = Unit.where(id: params[:id]).first
    end

    def unit_params
      params.require(:unit).permit(:length, :breadth, :quantity, :rate, :offer, images:[])
    end

    def set_storage_unit
      @storage_unit = StorageUnit.where(id: params[:storage_unit_id]).first
    end

end
