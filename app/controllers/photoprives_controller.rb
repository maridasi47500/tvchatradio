class PhotoprivesController < ApplicationController
  before_action :set_photoprife, only: %i[ show edit update destroy ]

  # GET /photoprives or /photoprives.json
  def index
    @photoprives = Photoprive.all
  end

  # GET /photoprives/1 or /photoprives/1.json
  def show
  end

  # GET /photoprives/new
  def new
    @photoprife = Photoprive.new
  end

  # GET /photoprives/1/edit
  def edit
  end

  # POST /photoprives or /photoprives.json
  def create
    @photoprife = Photoprive.new(photoprife_params)

    respond_to do |format|
      if @photoprife.save
        format.html { redirect_to photoprife_url(@photoprife), notice: "Photoprive was successfully created." }
        format.json { render :show, status: :created, location: @photoprife }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @photoprife.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photoprives/1 or /photoprives/1.json
  def update
    respond_to do |format|
      if @photoprife.update(photoprife_params)
        format.html { redirect_to photoprife_url(@photoprife), notice: "Photoprive was successfully updated." }
        format.json { render :show, status: :ok, location: @photoprife }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @photoprife.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photoprives/1 or /photoprives/1.json
  def destroy
    @photoprife.destroy!

    respond_to do |format|
      format.html { redirect_to photoprives_url, notice: "Photoprive was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photoprife
      @photoprife = Photoprive.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photoprife_params
      params.require(:photoprife).permit(:user_id, :image)
    end
end
