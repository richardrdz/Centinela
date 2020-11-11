class ReportsController < ApplicationController
  before_action :authorize_by_access_header!
  before_action :set_report, only: [:show, :update, :destroy]
  # GET /reports
  def index
    @reports = Report.all
    render json: @reports
  end
  # GET /myreports
  def reportsUser
    @reports = current_user.reports.all
    render json: @reports
  end
  # GET /reportsbycoordinate
  def reportsByCoordinate
    @reports = Report.where(created_at: 24.hours.ago..Time.now).near([params[:latitude],  params[:longitude]], params[:ratio])
    render json: @reports
  end
  # GET /reportsbytypereport/1/latitude/longitude/ratio
  def reportsByTypeReport
    @reports = Report.where(types_report_id: params[:type], created_at: 24.hours.ago..Time.now).near([params[:latitude],  params[:longitude]], params[:ratio])
    render json: @reports
  end
  # GET /reports/1
  def show
    render json: @report
  end

  # POST /reports
  def create
    @report = current_user.reports.create(report_params)
    if @report.save
      render json: @report, status: :created, location: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reports/1
  def update
    if @report.update(report_params)
      render json: @report
    else
      render json: @report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reports/1
  def destroy
    @report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = current_user.reports.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def report_params
      params.permit(:latitude, :longitude, :image, :types_report_id)
    end
end
