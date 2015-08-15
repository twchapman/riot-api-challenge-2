@Champions = new Mongo.Collection('Champions')

if Meteor.isServer
  if @Champions.find().count() is 0
    championList = RiotAPI.staticData.getChampions()
    for champion, data of championList.data
      @Champions.insert(data)
