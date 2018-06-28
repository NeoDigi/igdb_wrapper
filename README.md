
[![Build Status](https://travis-ci.org/NeoDigi/igdb_wrapper.svg?branch=master)](https://travis-ci.org/NeoDigi/igdb_wrapper)

# api-dart
A Dart wrapper for the IGDB.com Free Video Game Database API.

## About IGDB
One of the principles behind IGDB.com is accessibility of data. We wish to share the data with anyone who wants to build cool videogame oriented websites, apps and services. This means that the information you contribute to IGDB.com can be used by other projects as well.

Thus, you are not only contributing to the value of this site but to thousands of other projects as well. We are looking forward to see what exciting game related projects you come up with. Happy coding!

More info here:
* [About the API](https://www.igdb.com/api)
* [API Documentation](https://igdb.github.io/api/about/welcome/)

## Libraries
This wrapper uses three libraries for http requests.
* [http](https://github.com/dart-lang/http)

## Using your API key
* Create a new APIWrapper Object by passing you 3Scale key, setting version (Pro or standard), and set isDebug (prints queries)
``` dart
IGDBWrapper wrapper = new IGDBWrapper("YOUR_API_KEY", version: Version.STANDARD, debug: true);
```

## Usage
All API endpoints are available as methods in the APIWrapper object. Each method has the following signature:
### wrapper.endpoint(Parameters)
__Arguments__
* Parameters - An object specifying the operations to be performed, ex. expander, filter, ordering etc. These Operations can be found in the API documentation under References: (https://igdb.github.io/api/references/)

__Example__ 
* Requesting games from API 
``` dart
IGDBWrapper wrapper = new IGDBWrapper("YOUR_API_KEY", version: Version.STANDARD, debug: false);
params = new Parameters()
	.addFields("*")
	.addOrder("published_at:desc");
	
wrapper.games(params).then((result) => print("Response body: ${loaded.body}"));
// The sent request will look like this:
// https://api-endpoint.igdb.com/games/?fields=*&order=published_at:desc
```

The rest of the endpoints work similarly to the Games endpoint except for two cases presented bellow.

* Requesting search from the API
``` dart
IGDBWrapper wrapper = new IGDBWrapper("YOUR_API_KEY", version: Version.STANDARD, debug: false);
params = new Parameters()
	.addSearch("searchQuery")
	.addFields("*")
	.addOrder("published_at:desc");

wrapper.search(Endpoint.GAMES, params).then((result) => print("Response body: ${loaded.body}"));

// The sent request will look like this:
// https://api-endpoint.igdb.com/games/?search=searchQuery&fields=*&order=published_at:desc

```
The search endpoint need an extra parameter, Endpoint, as you can search any endpoint for information.

* Filtering a request result
``` dart
IGDBWrapper wrapper = new IGDBWrapper("YOUR_API_KEY", version: Version.STANDARD, debug: false);
params = new Parameters()
	.addFields("*")
	.addFilter("[themes][not_in]=42")
	.addOrder("published_at:desc");

wrapper.games(params).then((result) => print("Response body: ${loaded.body}"));

// The sent request will look like this:
// https://api-endpoint.igdb.com/games/?search=searchQuery&fields=*&filter[themes][not_in]=42&order=published_at:desc

```
Filtering requires extra information in the arguments and needs to be written out like in the example above. 
Information about Filtering and the postfixes like 'not_in' can be found [here](https://igdb.github.io/api/references/filters/).

The rest of the available Endpoints are [Available Here](https://igdb.github.io/api/endpoints/).
The IGDB API documentation provides [details on search parameters](https://igdb.github.io/api/references/filters/).


## More examples

```dart
IGDBWrapper wrapper = new IGDBWrapper("YOUR_API_KEY", version: Version.STANDARD, debug: false);

//Search for up to two Atari platforms and return their names
params = new Parameters()
	.addSearch("Atari")
	.addFields("name")
	.addLimit("2");

wrapper.search(Endpoint.PLATFORMS, params).then((result) => print("Response body: ${loaded.body}"));

// The sent request will look like this:
// https://api-endpoint.igdb.com/platforms/?search=Atari&fields=name&limit=2

/*
Search for up to five Zelda games with release dates between 1 Jan and 31 Dec 2011, sorted by release date in descending order.
*/ 

params = new Parameters()
	.addSearch("Zelda")
	.addFields("name,release_dates.date,rating,hypes,cover")
	.addFilter("[release_dates.date][gt]=2010-12-31")
	.addFilter("[release_dates.date][lt]=2012-01-01")
	.addLimit("2")
	.addOffset("0")
	.addOrder("release_dates.date:desc");

wrapper.search(Endpoint.PLATFORMS, params).then((result) => print("Response body: ${loaded.body}"));

// The sent request will look like this:
// https://api-endpoint.igdb.com/games/?search=Zelda&fields=name,release_dates.date,rating,hypes,cover&filter[release_dates.date][gt]=2010-12-31&filter[release_dates.date][lt]=2012-01-01&limit=5&order=release_dates.date:desc


// Search for two specific games by their IDs


params = new Parameters()
	.addIds("18472,18228")
	.addFields("name,cover");

wrapper.games(params).then((result) => print("Response body: ${loaded.body}"));

// The sent request will look like this:
// https://api-endpoint.igdb.com/games/18472,18228?fields=name,cover

// Search for companies with 'rockstar' in their name. Return up to five results sorted by name in descending order

params = new Parameters()
	.addSearch("rockstar")
	.addFields("name,logo")
	.addFilter("[name][in]=rockstar")
	.addLimit("5")
	.addOffset("0")
	.addOrder("name:desc");

wrapper.search(Endpoint.COMPANIES, params).then((result) => print("Response body: ${loaded.body}"));

// The sent request will look like this:
// https://api-endpoint.igdb.com/companies/?search=rockstar&fields=name,logo&filter[name][in]=rockstar&limit=5&offset=0&order=name:desc */

```