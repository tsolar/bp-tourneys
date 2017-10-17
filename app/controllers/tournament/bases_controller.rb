class Tournament::BasesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_tournament_basis, only: [:show, :edit, :update, :destroy]

  # GET /tournament/bases
  # GET /tournament/bases.json
  def index
    @tournament_bases = Tournament::Base.all
  end

  # GET /tournament/bases/1
  # GET /tournament/bases/1.json
  def show
  end

  # GET /tournament/bases/new
  def new
    @tournament_basis = Tournament::Base.new(owner: current_user)
  end

  # GET /tournament/bases/1/edit
  def edit
  end

  # POST /tournament/bases
  # POST /tournament/bases.json
  def create
    @tournament_basis = Tournament::Base.new(tournament_basis_params)
    @tournament_basis.owner = current_user

    respond_to do |format|
      if @tournament_basis.save
        format.html { redirect_to tournament_path(@tournament_basis), notice: 'Base was successfully created.' }
        format.json { render :show, status: :created, location: @tournament_basis }
      else
        format.html { render :new }
        format.json { render json: @tournament_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament/bases/1
  # PATCH/PUT /tournament/bases/1.json
  def update
    respond_to do |format|
      if @tournament_basis.update(tournament_basis_params)
        format.html { redirect_to tournament_path(@tournament_basis), notice: 'Base was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament_basis }
      else
        format.html { render :edit }
        format.json { render json: @tournament_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament/bases/1
  # DELETE /tournament/bases/1.json
  def destroy
    @tournament_basis.destroy
    respond_to do |format|
      format.html { redirect_to tournaments_url, notice: 'Base was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_basis
      @tournament_basis = Tournament::Base.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_basis_params
      params.require(:tournament_base).permit(:name)
    end
end
