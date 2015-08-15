@Matches = new Mongo.Collection('Matches')

if Meteor.isServer
  storeMatch = (matchId) ->
    match = RiotAPI.match.get(matchId)
    @Matches.insert(match)

  if @Matches.find().count() < 10
    matchesToLoad = [
      1907069332,
      1907069429,
      1907069695,
      1907126170,
      1907126706,
      1907126928,
      1907127301,
      1907127911,
      1907127945,
      1907128270,
      1907128585,
    ]

    for match in matchesToLoad
      storeMatch(match)
      Meteor._sleepForMs(1000)