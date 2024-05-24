class PhotopublicsController < ApplicationController
  before_action :set_photopublic, only: %i[ show edit update destroy ]

  # GET /photopublics or /photopublics.json
  def index
    @photopublics = Photopublic.all
  end

  # GET /photopublics/1 or /photopublics/1.json
  def show
  end

  # GET /photopublics/new
  def new
    @photopublic = Photopublic.new
  end

  # GET /photopublics/1/edit
  def edit
  end

  # POST /photopublics or /photopublics.json
  def create
    @photopublic = Photopublic.new(photopublic_params)

    respond_to do |format|
      if @photopublic.save
        format.html { redirect_to photopublic_url(@photopublic), notice: "Photopublic was successfully created." }
        format.json { render :show, status: :created, location: @photopublic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photopublic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photopublics/1 or /photopublics/1.json
  def update
    respond_to do |format|
      if @photopublic.update(photopublic_params)
        format.html { redirect_to photopublic_url(@photopublic), notice: "Photopublic was successfully updated." }
        format.json { render :show, status: :ok, location: @photopublic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photopublic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photopublics/1 or /photopublics/1.json
  def destroy
    @photopublic.destroy!

    respond_to do |format|
      format.html { redirect_to photopublics_url, notice: "Photopublic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photopublic
      @photopublic = Photopublic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photopublic_params
      params.require(:photopublic).permit(:user_id, :image)
    end
end
