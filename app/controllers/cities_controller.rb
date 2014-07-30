# TODO: TIES!
# Examine Red Deer, Alta for rainfall
# It has exact same data as Sylvan Lake but scores lower due to my simplified ranking

# http://www.moneysense.ca/property/canadas-best-places-to-live-2014-methodology

# Definitions:
# A small city is defined by a population below 100,000
# A mid-size city has population of between 100,000 and 400,000
# A large city has a minimum population of 400,000
# Total points: 103
# Sort by each attribute, then #1 gets most points and last place gets 0 points
# Population growth ideal: 8.2% = average of Canada (6.2% + 2%) - rank difference from 8.2%
# Precipitation ideal: 700mm
# Default points breakdown:
# population

# Walk/Bike to Work: 6
# walk_to_work 3
# bike_to_work 3

# Transit: 5
# transit_to_work 5

# Weather: 10
# rainfall 2
# days_with_rain 3
# days_with_precip 1
# days_above_0 3
# days_above_20 1
# days_above_24 0
# days_below_min20 0
# mean_daily_temp 0

# Population Growth: 8
# popgrowth 8

# Unemployment: 10
# unemp_rate 10

# Housing: 12
# avg_house_price 6
# avg_years_to_buy_house 6
# avg_property_tax 0

# Household Income: 5
# avg_hshld_income 5
# avg_hshld_networth 0 (Error in description -- witheld)

# Discretionary Income: 5
# avg_disc_income 5

# New Cars: 1
# new_cars 1

# New Luxury Cars: 1 (Error in table -- witheld)
# new_luxury_cars 1

# Income Taxes: 3
# income_tax 3

# Sales Taxes: 1
# sales_tax 1

# Property Tax Rate: 2
# property_tax 2

# Property Tax Paid As A % of Income: 1
# prop_tax_as_perc 1

# Crime: 7
# crime_severity 2
# crime_per_100k 2
# change_in_crime 1
# violent_crime_severity 2

# Doctors: 5
# doctors_per_1k 5

# Health Professionals: 4
# employed_in_health 4

# Number of Doctors Offices Per 1k: 1
# medical_offices_per_1k 1

# Amenitios: 6
# hospital 2
# college 1
# university 1
# movie_theatre 0.5
# prox_major_airport [1.5, 1, 0.5]

# Culture: 5
# employed_in_arts 5

class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]

  def get_ranks(a)
    rank = 0
    a.map { |k,v|
      ret = [rank] * v.size
      rank += v.size
      ret
    }.flatten
  end

  def default_rank
    # Each rank position loses us this multiplier times the number of available points
    cnt  = City.count
    mult = 1.0 / (cnt-1)

    # Initialize points
    @cities.each do |c| 
      @info[c] ||= {}
      @info[c][:points] = 0
    end

    # walk_to_work
    # ranks = get_ranks @cities.sort_by! { |c| c.walk_to_work }.reverse!.group_by { |c| c.walk_to_work }
    # @cities.each_with_index { |c,i| @info[c][:points] += 3 * (1 - ranks[i] * mult) }

    # bike_to_work
    # ranks = get_ranks @cities.sort_by! { |c| c.bike_to_work }.reverse!.group_by { |c| c.bike_to_work }
    # @cities.each_with_index { |c,i| @info[c][:points] += 3 * (1 - ranks[i] * mult) }

    # transit_to_work
    # ranks = get_ranks @cities.sort_by! { |c| c.transit_to_work }.reverse!.group_by { |c| c.transit_to_work }
    # @cities.each_with_index { |c,i| @info[c][:points] += 5 * (1 - ranks[i] * mult) }

    # rainfall 2
    # Original methodology -- aim for ideal amount of precipitation
    # ranks = get_ranks @cities.sort_by! { |c| (c.rainfall - 700).abs }.group_by { |c| (c.rainfall - 700).abs }
    # Alternate methodology -- aim for minimal precipitation
    # @cities.sort_by! { |c| c.rainfall }
    # @cities.each_with_index { |c,i| @info[c][:points] += 2 * (1 - ranks[i] * mult) }

    # days_with_rain 3
    # ranks = get_ranks @cities.sort_by! { |c| c.days_with_rain }.group_by { |c| c.days_with_rain }
    # @cities.each_with_index { |c,i| @info[c][:points] += 3 * (1 - ranks[i] * mult) }

    # days_with_precip 1
    # ranks = get_ranks @cities.sort_by! { |c| c.days_with_precip }.group_by { |c| c.days_with_precip }
    # @cities.each_with_index { |c,i| @info[c][:points] += 1 * (1 - ranks[i] * mult) }

    # days_above_0 3
    # ranks = get_ranks @cities.sort_by! { |c| c.days_above_0 }.reverse!.group_by { |c| c.days_above_0 }
    # @cities.each_with_index { |c,i| @info[c][:points] += 3 * (1 - ranks[i] * mult) }

    # days_above_20 1
    # ranks = get_ranks @cities.sort_by! { |c| c.days_above_20 }.reverse!.group_by { |c| c.days_above_20 }
    # @cities.each_with_index { |c,i| @info[c][:points] += 1 * (1 - ranks[i] * mult) }

    # popgrowth 8
    # Original methodology -- aim for ideal amount of population growth
    # ranks = get_ranks @cities.sort_by! { |c| (c.popgrowth - 0.082).abs }.group_by { |c| (c.popgrowth - 0.082).abs }
    # Alternate methodology -- aim for minimal precipitation
    # @cities.sort_by! { |c| c.rainfall }
    # @cities.each_with_index { |c,i| @info[c][:points] += 8 * (1 - ranks[i] * mult) }

    # unemp_rate 10
    # ranks = get_ranks @cities.sort_by! { |c| c.unemp_rate }.group_by { |c| c.unemp_rate }
    # @cities.each_with_index { |c,i| @info[c][:points] += 10 * (1 - ranks[i] * mult) }

    # avg_house_price 6
    # ranks = get_ranks @cities.sort_by! { |c| c.avg_house_price }.group_by { |c| c.avg_house_price }
    # @cities.each_with_index { |c,i| @info[c][:points] += 6 * (1 - ranks[i] * mult) }

    # avg_years_to_buy_house 6
    # ranks = get_ranks @cities.sort_by! { |c| c.avg_years_to_buy_house }.group_by { |c| c.avg_years_to_buy_house }
    # @cities.each_with_index { |c,i| @info[c][:points] += 6 * (1 - ranks[i] * mult) }

    # avg_hshld_income 5
    # ranks = get_ranks @cities.sort_by! { |c| c.avg_hshld_income }.reverse!.group_by { |c| c.avg_hshld_income }
    # @cities.each_with_index { |c,i| @info[c][:points] += 5 * (1 - ranks[i] * mult) }

    # avg_disc_income 5
    # ranks = get_ranks @cities.sort_by! { |c| c.avg_disc_income }.reverse!.group_by { |c| c.avg_disc_income }
    # @cities.each_with_index { |c,i| @info[c][:points] += 5 * (1 - ranks[i] * mult) }

    # avg_hshld_networth 0 (or 5 in the table?!)
    # ranks = get_ranks @cities.sort_by! { |c| c.avg_hshld_networth }.reverse!.group_by { |c| c.avg_hshld_networth }
    # @cities.each_with_index { |c,i| @info[c][:points] += 5 * (1 - ranks[i] * mult) }

    # new_cars 1
    # ranks = get_ranks @cities.sort_by! { |c| c.new_cars }.reverse!.group_by { |c| c.new_cars }
    # @cities.each_with_index { |c,i| @info[c][:points] += 1 * (1 - ranks[i] * mult) }

    # new_luxury_cars 1
    # ranks = get_ranks @cities.sort_by! { |c| c.new_luxury_cars }.reverse!.group_by { |c| c.new_luxury_cars }
    # @cities.each_with_index { |c,i| @info[c][:points] += 1 * (1 - ranks[i] * mult) }

    # income_tax 3
    @rank_tbl = @cities.map { |c| c.income_tax }.uniq.sort
    @cities.each { |c| @info[c][:points] += 3 * (1 - @rank_tbl.index(c.income_tax).fdiv(@rank_tbl.length-1)) }

  end

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all.to_a

    @info = {}

    default_rank

    # Determine a ranking number...
    # i = 1
    # @info.sort_by { |city,info| info[:points] }.reverse.each do |city,info|
    #   @info[c] = {
    #     rank: i
    #   }
    #   i += 1
    # end

    @info = @info.sort_by { |city, info| info[:points] }.reverse
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: 'City was successfully created.' }
        format.json { render :show, status: :created, location: @city }
      else
        format.html { render :new }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: 'City was successfully updated.' }
        format.json { render :show, status: :ok, location: @city }
      else
        format.html { render :edit }
        format.json { render json: @city.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.json
  def destroy
    @city.destroy
    respond_to do |format|
      format.html { redirect_to cities_url, notice: 'City was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params[:city]
    end
end
