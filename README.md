# bstatus
Checks the status of given bikeshare station ID's from the API

## Usage

Current usage is to run runner.rb in Ruby. This checks and updates the status of the "target stations" for
Denver. 

ruby lib/runner.rb

>
```
Updated: 2016-08-04 10:30:13 -0600 (15 seconds ago)
ID   	Station Name			    Bikes	Docks
1686	Market Street Station    	17  	04
1799	1450 Wazee               	11  	04
3397	16th & Chestnut          	14  	04
```


## To Do:

* Allow stations to be passed in as arguments
* Allow valid cities to be passed in through arguments
* Method to look up stations, their IDs and names and allow user to select from there
* Georgraphic lookup for closest stations (each station has lat/lon coords)
