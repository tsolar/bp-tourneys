class Player::BasesController < ApplicationController
  before_action :set_player_basis, only: [:show, :edit, :update, :destroy]

  # GET /player/bases
  # GET /player/bases.json
  def index
    @player_bases = Player::Base.all
  end

  # GET /player/bases/1
  # GET /player/bases/1.json
  def show
  end

  # GET /player/bases/new
  def new
    @player_basis = Player::Base.new
  end

  # GET /player/bases/1/edit
  def edit
  end

  # POST /player/bases
  # POST /player/bases.json
  def create
    @player_basis = Player::Base.new(player_basis_params)

    respond_to do |format|
      if @player_basis.save
        format.html { redirect_to @player_basis, notice: 'Basis was successfully created.' }
        format.json { render :show, status: :created, location: @player_basis }
      else
        format.html { render :new }
        format.json { render json: @player_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /player/bases/1
  # PATCH/PUT /player/bases/1.json
  def update
    respond_to do |format|
      if @player_basis.update(player_basis_params)
        format.html { redirect_to @player_basis, notice: 'Basis was successfully updated.' }
        format.json { render :show, status: :ok, location: @player_basis }
      else
        format.html { render :edit }
        format.json { render json: @player_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /player/bases/1
  # DELETE /player/bases/1.json
  def destroy
    @player_basis.destroy
    respond_to do |format|
      format.html { redirect_to player_bases_url, notice: 'Basis was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_player_basis
      @player_basis = Player::Base.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def player_basis_params
      params.fetch(:player_basis, {})
    end
end
