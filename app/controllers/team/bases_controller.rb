class Team::BasesController < ApplicationController
  before_action :set_team_basis, only: [:show, :edit, :update, :destroy]

  # GET /team/bases
  # GET /team/bases.json
  def index
    @team_bases = Team::Base.all
  end

  # GET /team/bases/1
  # GET /team/bases/1.json
  def show
  end

  # GET /team/bases/new
  def new
    @team_basis = Team::Base.new
  end

  # GET /team/bases/1/edit
  def edit
  end

  # POST /team/bases
  # POST /team/bases.json
  def create
    @team_basis = Team::Base.new(team_basis_params)

    respond_to do |format|
      if @team_basis.save
        format.html { redirect_to @team_basis, notice: "Base was successfully created." }
        format.json { render :show, status: :created, location: @team_basis }
      else
        format.html { render :new }
        format.json { render json: @team_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team/bases/1
  # PATCH/PUT /team/bases/1.json
  def update
    respond_to do |format|
      if @team_basis.update(team_basis_params)
        format.html { redirect_to @team_basis, notice: "Base was successfully updated." }
        format.json { render :show, status: :ok, location: @team_basis }
      else
        format.html { render :edit }
        format.json { render json: @team_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team/bases/1
  # DELETE /team/bases/1.json
  def destroy
    @team_basis.destroy
    respond_to do |format|
      format.html { redirect_to team_bases_url, notice: "Base was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_basis
      @team_basis = Team::Base.find_by(id: params[:id])
      render file: "public/404", status: 404, layout: false unless @team_basis
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_basis_params
      params.require(:team_base).permit(:name)
    end
end
