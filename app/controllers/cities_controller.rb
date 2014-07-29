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
# avg_hshld_networth 0

# Discretionary Income: 5
# avg_disc_income 5

# New Cars: 1
# new_cars 1

# New Luxury Cars: 1
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

  def default_rank
    # Each rank position loses us this multiplier times the number of available points
    cnt  = City.count
    mult = 1.0 / (cnt-1)

    # Initialize points
    @points = {}
    @cities.each { |c| @points[c] = 0 }

    # walk_to_work
    @cities.sort_by! { |c| c.walk_to_work }.reverse!
    @cities.each_with_index { |c,i| @points[c] += 3 * (1 - i * mult) }
  end

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all.to_a
    
    default_rank
    @ranks = {}
    i = 1
    @points.sort_by { |c,p| p }.reverse.each do |c,p|
      @ranks[c] = i
      i += 1
    end
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
