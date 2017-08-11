'use strict';

const Boom = require('boom');
const Hapi = require('hapi');

const store = require('./store');

const server = new Hapi.Server();
server.connection({
  host: 'localhost',
  port: 3000,
  routes: {
    cors: true
  }
});

const basePath = '/api';

server.route({
  method: 'GET',
  path: basePath + '/games',
  handler: function(request, reply) {
    const games = store.getGames();
    return reply(games);
  }
});

server.route({
  method: 'GET',
  path: basePath + '/games/{gameId}',
  handler: function({ params }, reply) {
    const game = store.getGame(params.gameId);

    if (!game) {
      return reply(Boom.notFound(`Game with ID #${params.gameId} was not found`));
    }

    return reply(game);
  }
});

server.start((err) => {

  if (err) {
    throw err;
  }
  console.log(`Server running at: ${server.info.uri}`);
});
