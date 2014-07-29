require 'csv'

namespace :cities do
  desc "Seed the City model with information loaded from a .csv file"
  task seed: :environment do
    City.destroy_all
    data = CSV.read('db/ranking.csv')
    data.each do |c|
      City.create(
        original_rank: c[0],
        name: c[1],
        population: c[2],
        popgrowth: c[3],
        unemp_rate: c[4],
        avg_hshld_income: c[5],
        avg_disc_income: c[6],
        avg_hshld_networth: c[7],
        avg_house_price: c[8],
        avg_years_to_buy_house: c[9],
        property_tax: c[10],
        avg_property_tax: c[11],
        prop_tax_as_perc: c[12],
        sales_tax: c[13],
        income_tax: c[14],
        new_cars: c[15],
        new_luxury_cars: c[16],
        walk_to_work: c[17],
        bike_to_work: c[18],
        transit_to_work: c[19],
        rainfall: c[20],
        days_with_precip: c[21],
        days_with_rain: c[22],
        days_above_0: c[23],
        days_above_20: c[24],
        days_above_24: c[25],
        days_below_min20: c[26],
        mean_daily_temp: c[27],
        change_in_crime: c[28],
        crime_per_100k: c[29],
        crime_severity: c[30],
        violent_crime_severity: c[31],
        medical_offices_per_1k: c[32],
        employed_in_health: c[33],
        doctors_per_1k: c[34],
        employed_in_arts: c[35]
      )
    end
  end

end
