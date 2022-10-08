# Big Data Hackathon for San Diego 2019

## Day 2, MAR 16: Final Project Submission Guidelines

### Light Smart

<b>Objective</b>:

* Reduce light pollution and energy consumption from city street lights

<b>Background</b>:
* The City of San Diego is spending approximately $5,610 for 40,000 lights for 11 hours. That is $2,044,000 million per year.  Which produced approximately 922,931lx during the night hours.  Which raises the light level of the city by about 0.338lm/ft2 which is 3x more than the average brightness of the moon.
* Artificial lights can lead baby sea turtles to their demise
* Sea turtles live in the ocean but hatch at night on the beach.
  * Hatchlings find the sea by detecting the bright horizon over the ocean. Artificial lights draw them away from the ocean. In Florida alone, millions of hatchlings die this way every year.
* Effects of dimming light-emitting diode street lights on light-opportunistic and light-averse bats in suburban habitats
* It is possible to achieve a light intensity that provides both economic and ecological benefits by providing sufficient light for human requirements while not deterring light-averse bats.
* Humans evolved to the rhythms of the natural light-dark cycle of day and night (circadian rhythm). Research suggests that artificial light at night can negatively affect human health, increasing risks for obesity, depression, sleep disorders, diabetes, breast cancer and more.

<b>Our Solution:</b>
* Using the city regulations for acceptable illuminance levels, we have designed policies and procedures for smart traffic light network using our luminosity control system to dynamically adapt with the changing traffic situations.

<b>How it works:</b>
* The street lights are IoT enabled. They can talk to each other and to the central server sitting on the cloud.
* Each street light will record the traffic conditions of the road using a camera and various other sensors
* Each street light will dynamically compute the optimal brightness needed for that particular traffic condition and share the results of the computation with other nearby lights and with the cloud server.
* Over time, these lights will get more accurate and learn to be intuitive using machine learning algorithms.
* This will enable us to predict the power consumption and costs down the road for the whole city.

<b>Our Findings:</b>

* Datasets
  * US department of Transportation, US traffic 2015
      * The above dataset was used to determine traffic density for locations found within San Diego City. This dataset included hourly measurements of traffic (number of cars) taken every day of the year for 2015
  * San Diego Street Light locations (SCALE SD)
      * Using the streetlight locations, we found that the majority of lights are induction type bulbs. In 2011, the city of San Diego added 35,000 induction bulbs because they were more economical and ecological.

* We found a radius (5 miles) of street lights between north park and city heights where traffic information was capture. The traffic data was filtered by each month. A comparison chart was created to determine traffic patterns. We found that the traffic patterns are similar throughout the year. The below graph illustrates traffic patterns throughout the year during the night.

![Hours vs Cars](hours_vs_cars.png)

* We separated the traffic into three categories (low, medium, high). Because cars can produce effective lighting for the environment (depending on the number of cars) we can lower the luminosity from the street lights.  
  * During no traffic (still cars on the road) we will use the guidelines recommended by City of San Diego Street Lighting (6.0 lux)
  * During low traffic load we are using highest wattage for lights (10.0 lux)
  * During medium traffic load we are using medium wattage for lights (8.0 lux)
  * During high traffic load we are using low wattage for lights (6.0 lux)
  * For pedestrians and cyclist we will use optimal lighting levels (3.0 lux)

<b>Visualization:</b>
* https://www.youtube.com/watch?v=E32ZOP7tlMA
* https://smartlight-savings.firebaseapp.com/
* https://github.com/BigDataForSanDiego/2019-Team-201/blob/master/Proposal/sd_streetlights_map_large.html

* First Visualization
  * Interactive map of the street lights that are present in San Diego Currently. Our project is to show the benefit of smart lights and how they can help you save cost and the environment. Click on the lights to turn them to smart lights and contribute to the savings.
    * When you turn one street light to a smart street light
    * You save xx in cost
    * Xx in wattage
    * Xx in lux
* Second visualization
  * It is a 24 hrs simulation of highway 805. There is a traffic station in the middle that records everyday traffic data by the hour. The simulation is the traffic flow from 6pm to 6pm the next day where the normal lights give out the same lux of light but the smart light dims and brightens as necessary saving x amount of lux and y amount of dollars.

<b>Other Applications:</b>
* Parking:
  * Can identify empty spots on the street and notify parkers thru an app.

* Crime:
  * System can be trained to identify any suspicious or abnormal activities.

* Accidents:
  * Can identify accidents, promptly report the authorities and tell the factors leading to the accident.
* Wildlife:
  * In the future, identify lighting near San Diego’s wildlife refuges, and reduce lighting when safe for nocturnal species, such as bats.
* Astronomy & Space Science:  
  * In the future work with Palomar Observatory (CalTech) and NASA, to measure cumulative illuminance (lux) levels regionally for the City of San Diego and eventually San Diego County. Goal to reduce light pollution in the San Diego metropolitan region.  

<b>Extended Features:</b>
* AI
  * With increase usage overtime the smart lights will create more accurate predictions for light fluxuations, traffic reporting, parking etc. etc.
* Wisdom of Crowd:
  * Since every system has its own data, different systems could learn more from each other by sharing data.
  * These smart lights can give live traffic updates that are more accurate than those of Apple and Google Maps.
  * Since this is a network of lights, the lights can communicate with each other to better control traffic.
  * Since the lights can communicate, if a sector of lights go down the surrounding smart lights will optimize the environment to create predictions for traffic and light requirements

<b>Conclusion:</b>
* Savings
  * We estimate that under the new system we could save $2,800 per night to operation which would come out to almost $1,000,000 a year
* Light Pollution reduction
  * Wes estimate that we could reduce the light pollution by 419,316lx from approximately 40,000 lights across San Diego, which would raise the overall brightness of the city by approximately 0.114 lm/ft<sup>2</sup>

<b>FAQs:</b>
* How can we collect the traffic data?
  * We can collect the traffic data by tapping into the sensors in stoplight, that way we can have a more accurate and real time estimation.
* Would this system be implemented on every streetlight?
  * For now, this system can be implemented on any type of streetlight
* Without replacing any light bulb, how can this system be implemented?
  * Using the same algorithm, we could install a computer that will tap into the already existing stoplight sensors, to control how much wattage is going through an entire block, without the need to replace any bulbs.
* How do we know that car lights will provide enough coverage opposed to streetlights?
  * The standard for cars is 900-1000 lux, but these lights are dispersed vertically on the street and hence are not completely effective on their own to cover the horizontal section of the street and that’s why they need to be complemented by the streetlights.

<b>Glossary and Definitions:</b>
* “Illuminance” is the density of the luminous flux incident on a surface; it is the quotient of the luminous flux divided by the area of the surface when the latter is uniformly illuminated.
* “Average Maintained Footcandles” is the average level of horizontal illuminance on the roadway pavement when the output of the lamp and luminaire is diminished by the maintenance factors; expressed in average footcandles for the pavement area.
* “Local street” means a street that provides access to individual sites. Local streets include Minor Streets, Neighborhood Streets, Lanes, Alleys, Utility Access Roads, Trails, Loop Streets and Cul-de-sac Streets. On-street parking is required on Minor Streets and Neighborhood Streets.
* “Collector road” is a low-to-moderate-capacity road which serves to move traffic from local streets to arterial roads. Unlike arterials, collector roads are designed to provide access to residential properties. Rarely, jurisdictions differentiate major and minor collector roads, the former being generally wider and busier.
* “Major arterial” means a street whose primary purpose is to facilitate movement of heavy traffic between major residential areas, or major residential areas and commercial areas with minimal access. Major arterial streets may consist of 2, 4, or 6 lanes.
* Given the wattage that every bulb is using we can calculate the illuminance in lux that it is generating
* Induction lights have a lumen efficacy of around 55.6 lm/W<sup>2</sup>
* In order to find the current illuminance of the bulb we multiply the wattage, the efficacy, 10.76391 and divide it by the estimated surface area of the light. according to this formula.
  * lx = 10.76391 x W x * (lm/W) / ft<sup>2</sup>
* From there we are assuming that bulbs of wattage less than or equal to 90 are used for local/collector roads and those that are greater than 90 are used for major/local roads, given the streetlight city regulations, we can calculate the difference between what is considered a high, medium, and low level of illuminance.
![Illuminance for interactions](Illuminance_for_interactions.png)
* High, medium, and low illuminance levels will be set according to weather and traffic conditions. If the sensors detect precipitation or fog, then there will be no change in illuminance, this is what will be considered “high lux”
* If the sensors detect heavy traffic, then they will be set to “medium”
* If the sensors don’t detect heavy traffic then they will be set to “low”
* To calculate the difference in wattage, we will use the formula given above, and solve for wattage, given the new target lux. These values are displayed on our table as “med_wat” and “low_wat."

<b>References:</b>
* Recommended Light Levels:
  * https://www.noao.edu/education/QLTkit/ACTIVITY_Documents/Safety/LightLevels_outdoor+indoor.pdf
  * http://www.rtcsnv.com/wp-content/uploads/2012/07/300.S3-Redlined_2014-05-152.pdf
  * http://bsl.lacity.org/downloads/business/BSLDesignStandardsAndGuidelines0507Web.pdf


* Github:
    * https://github.com/BigDataForSanDiego/2019-Team-201
  * LUX/Lumen/Watts Conversion:
    * https://www.rapidtables.com/calc/light/how-lumen-to-watt.html
    * kWh per State:
    * https://www.npr.org/sections/money/2011/10/27/141766341/the-price-of-electricity-in-your-state
  * Induction Light lumen efficacy:
    * http://www.inductionlamps.com/pages/All-About-Induction.html
    * https://www.lrc.rpi.edu/programs/NLPIP/PDF/VIEW/SR_StreetlightsLocal.pdf
