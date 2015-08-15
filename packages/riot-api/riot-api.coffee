RiotAPI = {}

RiotAPI.regions =
    BR:
      platformId: 'BR1'
      host: 'br.api.pvp.net'
    EUNE:
      platformId: 'EUN1'
      host: 'eune.api.pvp.net'
    EUW:
      platformId: 'EUW1'
      host: 'euw.api.pvp.net'
    KR:
      platformId: 'KR'
      host: 'kr.api.pvp.net'
    LAN:
      platformId: 'LA1'
      host: 'lan.api.pvp.net'
    LAS:
      platformId: 'LA2'
      host: 'las.api.pvp.net'
    NA:
      platformId: 'NA1'
      host: 'na.api.pvp.net'
    OCE:
      platformId: 'OC1'
      host: 'oce.api.pvp.net'
    TR:
      platformId: 'TR1'
      host: 'tr.api.pvp.net'
    RU:
      platformId: 'RU'
      host: 'ru.api.pvp.net'
    PBE:
      platformId: 'PBE1'
      host: 'pbe.api.pvp.net'
    Global:
      platformId: '*'
      host: 'global.api.pvp.net'

RiotAPI.apiBase = '/api/lol'
RiotAPI.region = 'NA'

apiCall = (endpointObject, params) ->
  url = "https://#{RiotAPI.regions[RiotAPI.region].host}#{RiotAPI.apiBase}/#{RiotAPI.region.toLowerCase()}/v#{endpointObject.version}#{endpointObject.base}/#{params}?api_key=#{Meteor.settings['riotApiKey']}"
  return JSON.parse(HTTP.get(url).content)

staticApiCall = (endpointObject, params) ->
  url = "https://#{RiotAPI.regions.Global.host}#{RiotAPI.apiBase}#{endpointObject.base}/#{RiotAPI.region.toLowerCase()}/v#{endpointObject.version}/#{params}?api_key=#{Meteor.settings['riotApiKey']}"
  return JSON.parse(HTTP.get(url).content)

RiotAPI.champion =
  version: '1.2'
  base: '/champion'
  getAll: ->
    return apiCall(this, '')
  get: (id) ->
    return apiCall(this, id)

RiotAPI.currentGame =
  version: 'unsupported'

RiotAPI.featuredGames =
  version: 'unsupported'

RiotAPI.game =
  version: '1.0'
  base: '/game'
  getBySummonerId: (id) ->
    return apiCall(this, "by-summoner/#{id}/recent")

RiotAPI.league =
  version: '1.0'
  base: '/league'
  getBySummonerId: (ids) ->
    return apiCall(this, "by-summoner/#{ids.join(',')}")
  getEntriesBySummonerId: (ids) ->
    return apiCall(this, "by-summoner/#{ids.join(',')}/entry")
  getByTeamId: (ids) ->
    return apiCall(this, "by-team/#{ids.join(',')}")
  getEntriesByTeamId: (ids) ->
    return apiCall(this, "by-team/#{ids.join(',')}")
  getChallenger: ->
    return apiCall(this, 'challenger')
  getMaster: ->
    return apiCall(this, 'master')

RiotAPI.staticData =
  version: '1.2'
  base: '/static-data'
  getChampions: ->
    return staticApiCall(this, 'champion')
  getChampion: (id) ->
    return staticApiCall(this, "champion/#{id}")
  getItems: ->
    return staticApiCall(this, 'item')
  getItem: (id) ->
    return staticApiCall(this, "item/#{id}")
  getLanguageStrings: ->
    return staticApiCall(this, 'language-strings')
  getLanguages: ->
    return staticApiCall(this, 'languages')
  getMap: ->
    return staticApiCall(this, 'map')
  getMasteries: ->
    return staticApiCall(this, 'mastery')
  getMastery: (id) ->
    return staticApiCall(this, "mastery/#{id}")
  getRealms: ->
    return staticApiCall(this, 'realm')
  getRunes: ->
    return staticApiCall(this, 'rune')
  getRune: (id) ->
    return staticApiCall(this, "rune/#{id}")
  getSummonerSpells: ->
    return staticApiCall(this, 'summoner-spell')
  getSummonerSpell: (id) ->
    return staticApiCall(this, "summoner-spell/#{id}")
  getVersions: ->
    return staticApiCall(this, 'versions')

RiotAPI.status =
  version: 'unsupported'

RiotAPI.match =
  version: '2.2'
  base: '/match'
  get: (id) ->
    return apiCall(this, id)

RiotAPI.matchhistory =
  version: '2.2'
  base: '/matchhistory'
  get: (id) ->
    return apiCall(this, id)

RiotAPI.stats =
  version: '1.3'
  base: '/stats'
  getRanked: (id) ->
    return apiCall(this, "by-summoner/#{id}/ranked")
  getSummary: (id) ->
    return apiCall(this, "by-summoner/#{id}/summary")

RiotAPI.summoner =
  version: '1.4'
  base: '/summoner'
  get: (ids) ->
    return apiCall(this, ids.join(','))
  getByName: (names) ->
    return apiCall(this, "by-name/#{names.join(',')}")
  getMasteries: (ids) ->
    return apiCall(this, "#{ids.join(',')}/masteries")
  getNames: (ids) ->
    return apiCall(this, "#{ids.join(',')}/names")
  getRunes: (ids) ->
    return apiCall(this, "#{ids.join(',')}/runes")

RiotAPI.team =
  version: '2.4'
  base: '/team'
  get: (ids) ->
    return apiCall(this, ids.join(','))
  getBySummonerId: (ids) ->
    return apiCall(this, "by-summoner/#{ids}")
