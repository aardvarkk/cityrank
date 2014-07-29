class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|

      t.integer :original_rank
      t.string  :name
      t.integer :population
      t.decimal :popgrowth
      t.decimal :unemp_rate
      t.decimal :avg_hshld_income
      t.decimal :avg_disc_income
      t.decimal :avg_hshld_networth
      t.decimal :avg_house_price
      t.decimal :avg_years_to_buy_house
      t.decimal :property_tax
      t.decimal :avg_property_tax
      t.decimal :prop_tax_as_perc
      t.decimal :sales_tax
      t.decimal :income_tax
      t.decimal :new_cars
      t.decimal :new_luxury_cars
      t.decimal :walk_to_work
      t.decimal :bike_to_work
      t.decimal :transit_to_work
      t.decimal :rainfall
      t.decimal :days_with_precip
      t.decimal :days_with_rain
      t.decimal :days_above_0
      t.decimal :days_above_20
      t.decimal :days_above_24
      t.decimal :days_below_min20
      t.decimal :mean_daily_temp
      t.decimal :change_in_crime
      t.decimal :crime_per_100k
      t.decimal :crime_severity
      t.decimal :violent_crime_severity
      t.decimal :medical_offices_per_1k
      t.decimal :employed_in_health
      t.decimal :doctors_per_1k
      t.decimal :employed_in_arts

      t.timestamps
    end
  end
end