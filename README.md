# Lifestyle Home Search

## Spark Platform Keys
Your Spark Platform API keys can by creating a `config/application.yml` file.
Please set two variables `SPARK_API_KEY` and `SPARK_SECRET` equal to your Spark Platform API key and secret.

## Note About Tests
Tests rely on valid Spark fixture data. You are required to generate these fixture data files yourselves, as we are not able to include them in the repository for contractual reasons. This will require a valid Spark Platform API key.

Required fixture data:

* `/fixutres/home.json` - Representing a single home 
