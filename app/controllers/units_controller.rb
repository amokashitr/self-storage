class UnitsController < ApplicationController

  before_action :set_storage_unit
  before_action :set_unit, except: %i[index new]

  def index
    @units = @storage_unit.units
  end

  def new
    @unit = @storage_unit.units.new
  end

  def create
    @unit = @storage_unit.units.new(unit_params)
    @unit.save
  end

  def update
    @unit.update(unit_params)
  end

  def destroy
    @unit.destroy
  end

  private

    def set_unit
      @unit = Unit.where(id: params[:id]).first
    end

    def unit_params
      params.require(:unit).permit(:length, :breadth, :quantity, :rate, :offer)
    end

    def set_storage_unit
      @storage_unit = StorageUnit.where(id: params[:storage_unit_id]).first
    end

end
