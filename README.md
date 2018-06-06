# Lifestyle Home Search

Deployed on Heroku at https://glacial-gorge-32176.herokuapp.com/

Lifestyle Home Search is a proof of concept home search application designed to let you shop for the best homes to suit your needs. Do you like hiking? We'll find somes near trails. Do you like going to bars? Lets search around the best nightlife. Utilizing a combination of data from the SparkPlatform API and the Yelp API we make sure to only look for homes in the areas right for you.

## Running Server
For development, spin up the server with `foreman start -f Procfile.dev` to make sure that webpack debug info is coming through

## Spark Platform Keys
Your Spark Platform API keys can by creating a `config/application.yml` file.
Please set two variables `SPARK_API_KEY` and `SPARK_SECRET` equal to your Spark Platform API key and secret.

## Other required API keys
* Google oAuth
* Yelp

## Note About Tests
Tests rely on valid Spark fixture data. You are required to generate these fixture data files yourselves, as we are not able to include them in the repository for contractual reasons. This will require a valid Spark Platform API key.

Required fixture data:

* `/fixutres/home.json` - Representing a single home 
* `/fixtures/yelp.json` - Representing a Yelp API request to `/v3/businesses/search?location= . . .`
