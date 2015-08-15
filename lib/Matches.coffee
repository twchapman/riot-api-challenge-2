@Matches = new Mongo.Collection('Matches')

storeMatch = (matchId) ->
  match = RiotAPI.match.get(matchId)
  @Matches.insert(match)

if @Matches.find().count() <= 0
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
    1907128742,
    1907128824,
    1907129079,
    1907129141,
    1907129610,
    1907129669,
    1907152106,
    1907156776,
    1907157315,
    1907157392,
    1907157666,
    1907157876,
    1907157885,
    1907157964,
    1907158047,
    1907158238,
    1907158330,
    1907158657,
    1907159000,
    1907159096,
    1907159117,
    1907159224,
    1907159424,
    1907159514,
    1907180370,
    1907180383,
    1907180718,
    1907180785,
    1907180849,
    1907180880,
    1907181150,
    1907181183,
    1907181221,
    1907181235,
    1907181243,
    1907181295,
    1907181348,
    1907181546,
    1907181623,
    1907181689,
    1907181696,
    1907181845,
    1907181928,
    1907182039,
    1907182070,
    1907182356,
    1907182369,
    1907182565,
  ]

  for match in matchesToLoad
    storeMatch(match)