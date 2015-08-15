statHelpers =
  champions: =>
    return @Champions.find({}, {sort: { name: 1 }}).fetch()

Template.Stats.helpers(statHelpers)

championStatsHelpers =
  stats: (championId) =>
    championStats = @Stats.findOne().statisticsByChampion[championId]
    returnedStats = []
    for key, value of championStats
      returnedStats.push({
        key
        value
      })
    return returnedStats

Template.ChampionStats.helpers(championStatsHelpers)