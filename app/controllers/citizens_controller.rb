class CitizensController < ApplicationController
  def index
    if permitted_params_for_search.values.any?(&:present?)
      @citizens = filter_citizens
    else
      @citizens = Citizen.all
    end

    @page = params.permit(:page)
  end

  def new
    @country_codes = CountryCode.all
  end

  def create
    
  end

  private

  def permitted_params_for_search
    @permitted_params_for_search ||= params.permit(
      %i[name cpf cns email phone status page]
    )
  end

  def excluded_from_query
    %w[page]
  end

  def filter_citizens
    citizens = Citizen.where(nil)
    permitted_params_for_search.each do |key, value|
      next if excluded_from_query.include?(key)

      citizens = citizens.public_send("filter_by_#{key}", value) if value.present?
    end
    citizens
  end
end
