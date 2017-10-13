class Tournament::TeamsController < ApplicationController
  before_action :set_tournament, only: [:index, :new, :create, :show, :edit, :update, :destroy]
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
    @tournament_team = @tournament.tournament_teams.new
    @tournament_team.build_team
  end

  # GET /tournament/teams/1/edit
  def edit
  end

  # POST /tournament/teams
  # POST /tournament/teams.json
  def create
    @tournament_team = @tournament.tournament_teams.new(tournament_team_params)

    respond_to do |format|
      if @tournament_team.save
        format.html {
          redirect_to tournament_team_path(
            team_id: @tournament_team.team.to_param
          ),

          notice: 'Team was successfully created.'
        }
        format.json { render :show, status: :created, location: @tournament_team }
      else
        format.html {
          @tournament_team.build_team unless @tournament_team.team.present?
          render :new
        }
        format.json { render json: @tournament_team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tournament/teams/1
  # PATCH/PUT /tournament/teams/1.json
  def update
    respond_to do |format|
      if @tournament_team.update(tournament_team_params)
        format.html {
          # redirect_to @tournament_team, notice: 'Team was successfully updated.'
          redirect_to tournament_team_path(team_id: @tournament_team.team.to_param), notice: 'Team was successfully updated.'
        }
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
    respond_to do |format|
      if @tournament_team.destroy
        format.html { redirect_to tournament_teams_url, notice: 'Team was successfully destroyed.' }
        format.json { head :no_content }
      else
        format.html {
          flash[:error] = @tournament_team.errors.full_messages
          redirect_to tournament_teams_path(@tournament)

        }
        format.json { render json: @tournament_team.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tournament_team
      @tournament_team = Tournament::Team.find_by(
        tournament: @tournament,
        team: @team
      )
      render file: 'public/404', status: 404, layout: false unless @tournament_team
    end

    def set_tournament
      begin
        @tournament = Tournament::Base.find(params[:tournament_id])
      rescue Exception => e
        # render 'errors/404', status: 404, layout: 'application'
        render file: 'public/404', status: 404, layout: false
      end
    end

    def set_team
      begin
        @team = Team::Base.find(params[:team_id])
      rescue Exception => e
        # render 'errors/404', status: 404, layout: 'application'
        render file: 'public/404', status: 404, layout: false
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tournament_team_params
      params.require(:tournament_team).permit(
        :team_id,
        team_attributes: [
          :id,
          :name
        ],
        team_players_attributes: [
          :id,
          :player_id,
          :_destroy
        ],
        players_attributes: [
          :id,
          :_destroy,
          :name
        ]
      )
    end
end
