class TypesReportsController < ApplicationController
  before_action :set_types_report, only: [:show, :update, :destroy]
  before_action :authorize_by_access_header!
  # GET /types_reports
  def index
    @types_reports = TypesReport.all
    render json: @types_reports
  end

  # GET /types_reports/1
  def show
    render json: @types_report
  end

  # POST /types_reports
  def create
    @types_report = TypesReport.new(types_report_params)

    if @types_report.save
      render json: @types_report, status: :created, location: @types_report
    else
      render json: @types_report.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /types_reports/1
  def update
    if @types_report.update(types_report_params)
      render json: @types_report
    else
      render json: @types_report.errors, status: :unprocessable_entity
    end
  end

  # DELETE /types_reports/1
  def destroy
    @types_report.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_types_report
      @types_report = TypesReport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def types_report_params
      params.permit(:name, :img)
    end
end
