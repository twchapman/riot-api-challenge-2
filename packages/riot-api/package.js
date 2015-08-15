Package.describe({
  name: 'riot-api',
  version: '0.0.1',
  summary: 'A basic package for interfacing with the Riot Games API for League of Legends.',
  git: '',
  documentation: 'README.md'
});

Package.onUse(function(api) {
  api.versionsFrom('1.1.0.2');
  api.use(['coffeescript', 'http'], 'server');
  api.addFiles('riot-api.coffee', 'server');
  api.export('RiotAPI')
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('traviswchapman:riot-api');
  api.addFiles('riot-api-tests.js');
});
