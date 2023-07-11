import json
import requests
import pprint
import os

api_url = "https://pokeapi.co/api/v2/pokemon?limit=151"
response = requests.get(api_url)
data = response.json()
pokemons = []

for pokemon in data['results']:
  req = requests.get(pokemon['url'])
  datareq = req.json()

  reqspecie = requests.get(datareq['species']['url'])
  datareqspecie = reqspecie.json()

  reqevol = requests.get(datareqspecie['evolution_chain']['url'])
  dataevol = reqevol.json()

  optitype = []
  match len(datareq['types']):
    case 1:
      optitype.append(datareq['types'][0]['type']['name'])

    case 2:
      optitype.append(datareq['types'][0]['type']['name'])
      optitype.append(datareq['types'][1]['type']['name'])

  reqimagedefault = requests.get(datareq['sprites']['front_default'])
  os.makedirs(os.path.dirname(f"assets/img/{datareq['name']}_default.png"), exist_ok=True)
  file = open(f"assets/img/{datareq['name']}_default.png", "wb")
  file.write(reqimagedefault.content)
  file.close()

  reqimageshiny = requests.get(datareq['sprites']['front_shiny'])
  os.makedirs(os.path.dirname(f"assets/img/{datareq['name']}_shiny.png"), exist_ok=True)
  file2 = open(f"assets/img/{datareq['name']}_shiny.png", "wb")
  file2.write(reqimageshiny.content)
  file2.close()


  poke = {
    "id": datareq['id'],
    "name": datareq['name'],
    "weight": datareq['weight'],
    "height": datareq['height'],
    "img": f"assets/img/{datareq['name']}_default.png",
    "imgshiny": f"assets/img/{datareq['name']}_shiny.png",
    "types": optitype,
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