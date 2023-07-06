import json
import requests
import pprint

# api_url = "https://pokeapi.co/api/v2/pokemon/6"
# response = requests.get(api_url)
# data = response.json()
pokemons = []

req = requests.get('https://pokeapi.co/api/v2/pokemon/6')
datareq = req.json()

reqspecie = requests.get(datareq['species']['url'])
datareqspecie = reqspecie.json()

reqevol = requests.get(datareqspecie['evolution_chain']['url'])
dataevol = reqevol.json()

poke = {
  "id": datareq['id'],
  "name": datareq['name'],
  "weight": datareq['weight'],
  "height": datareq['height'],
  "img": datareq['sprites']['front_default'],
  "imgshiny": datareq['sprites']['front_shiny'],
  "types": datareq['types'],
  "stats": datareq['stats'],
  "species": {
    "base_happiness": datareqspecie['base_happiness'],
    "capture_rate": datareqspecie['capture_rate'],
    "is_legendary": datareqspecie['is_legendary'],
    "is_mythical": datareqspecie['is_mythical'], 
    "color": datareqspecie['color']["name"]
  },
  "evolution": dataevol['chain'],
}
pokemons.append(poke)

f = open(f'assets/data.json', mode="w")
f.write(json.dumps(pokemons))