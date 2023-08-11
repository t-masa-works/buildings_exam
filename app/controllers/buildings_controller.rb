class BuildingsController < ApplicationController
  def index
    @buildings = Building.all
  end

  def show
    set_building
  end

  def new
    @building = Building.new
    2.times{ @building.stations.build }
  end

  def edit
    set_building
  end

  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: "保存に成功しました" }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    set_building

    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, notice: "編集に成功しました" }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    set_building
    @building.destroy

    respond_to do |format|
      format.html { redirect_to buildings_url, notice: "対象を削除しました" }
      format.json { head :no_content }
    end
  end

  private
  def set_building
    @building = Building.find(params[:id])
  end

  def building_params
    params.require(:building).permit(:build, :price, :address, :age, :remarks, stations_attributes: [:line, :station, :distance, :_destroy])
  end
end