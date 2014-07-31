class City < ActiveRecord::Base

  CATEGORIES = {
    walk_to_work: "Walk to Work (%)",
    bike_to_work: "Bike to Work (%)",
    transit_to_work: "Transit to Work (%)",
    rainfall: "Rainfall (mm)",
    days_with_rain: "Days with Rain (days)",
    days_with_precip: "Days with Precipitation (days)",
    days_above_0: "Days Above 0°C",
    days_above_20: "Days Above 20°C",
    popgrowth: "Population Growth (%)",
    unemp_rate: "Unemployment Rate (%)",
    avg_house_price: "Average House Price ($)",
    avg_years_to_buy_house: "Average Time to Buy House (years)",
    avg_hshld_income: "Average Household Income ($)",
    avg_disc_income: "Average Discretionary Income ($)",
    avg_hshld_networth: "Average Household Net Worth ($)",
    new_cars: "New Cars (%)",
    new_luxury_cars: "New Luxury Cars (%)",
    income_tax: "Income Tax on $50,000 ($)",
    sales_tax: "Sales Tax (%)",
    property_tax: "Property Tax (%)",
    prop_tax_as_perc: "Property Tax % of Household Income (%)",
    crime_severity: "Crime Severity Index (#)",
    crime_per_100k: "Crimes Per 100,000 People (#)",
    change_in_crime: "5 Year Change in Crimes Per 100,000 People (#)",
    violent_crime_severity: "Violent Crime Severity Index (#)",
    doctors_per_1k: "Doctors Per 1000 People (#)",
    employed_in_health: "Employed in Healthcare (%)",
    medical_offices_per_1k: "Medical Offices / 1000 People (#)",
    employed_in_arts: "Employed in Arts (%)"
  }
  
end
