class Tournament::TeamsController < ApplicationController
  before_action :set_tournament, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_team, only: [:show, :edit, :update, :destroy]
  before_action :set_tournament_team, only: [:show, :edit, :update, :destroy]

  # GET /tournament/teams
  # GET /tournament/teams.json
  def index
    @tournament_teams = Tournament::Team.where(
      tournament: @tournament
    )
  end

  # GET /tournament/teams/1
  # GET /tournament/teams/1.json
  def show
  end

  # GET /tournament/teams/new
  def new
    @tournament_team = Tournament::Team.new
  end

  # GET /tournament/teams/1/edit
  def edit
  end

  # POST /tournament/teams
  # POST /tournament/teams.json
  def create
    @tournament_team = Tournament::Team.new(tournament_team_params)

    respond_to do |format|
      if @tournament_team.save
        format.html { redirect_to @tournament_team, notice: 'Team was successfully created.' }
        format.json { render :show, status: :created, location: @tournament_team }
      else
        format.html { render :new }
        format.json { render json: @tournament_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament/teams/1
  # PATCH/PUT /tournament/teams/1.json
  def update
    respond_to do |format|
      if @tournament_team.update(tournament_team_params)
        format.html { redirect_to @tournament_team, notice: 'Team was successfully updated.' }
        format.json { render :show, status: :ok, location: @tournament_team }
      else
        format.html { render :edit }
        format.json { render json: @tournament_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tournament/teams/1
  # DELETE /tournament/teams/1.json
  def destroy
    @tournament_team.destroy
    respond_to do |format|
      format.html { redirect_to tournament_teams_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_team
      @tournament_team = Tournament::Team.find_by(
        tournament: @tournament,
        team: @team
      )
    end

    def set_tournament
      @tournament = Tournament::Base.find(params[:tournament_id])
    end

    def set_team
      @team = Team::Base.find(params[:team_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_team_params
      params.fetch(:tournament_team, {})
    end
end
