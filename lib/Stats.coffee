@Stats = new Mongo.Collection('Stats')

calculateChampionStatisticsForMatch = (match, statisticsByChampion) ->
  participants = match['participants']
  for participant in participants
    stats = participant['stats']
    statisticsByChampion[participant['championId']] ?= {}
    for stat, value of stats
      #if isNaN(value) then continue
      statisticsByChampion[participant['championId']][stat] ?= 0
      statisticsByChampion[participant['championId']][stat] += value

calculateChampionStatistics = (matches) ->
  statisticsByChampion = {}
  for match in matches
    calculateChampionStatisticsForMatch(match, statisticsByChampion)
  @Stats.insert({statisticsByChampion})

if Meteor.isServer
  if Stats.find().count() <= 0
    matches = @Matches.find().fetch()
    calculateChampionStatistics(matches)

