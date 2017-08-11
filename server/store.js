'use strict';

function getGame(gameId) {
  const game = data.find(({ id }) => id === gameId);
  return formatGame(game);
}

function getGames() {
  return data.map(formatGame);
}

const data = [{
  id: '39863b20-d1df-4d04-9e08-49c1cc30fba4',
  startTime: '2016-12-25T05:30:30-06:00',
  endTime: '2016-12-25T06:30:30-06:00',
  players: [{
    id: '58067546-a787-4fbd-9bd2-92bf3f7839ed',
    username: '@aristides.melendez',
    role: 'werewolf',
    death: '39bd8fd2-83e1-42cf-a915-b81fe93bb828'
  }, {
    id: 'aed340be-03d4-4da8-add7-a88e2bc72b14',
    username: '@rdeeb',
    role: 'villager',
    death: null
  }, {
    id: '207aca14-04c3-4e03-8091-9a4f8f65c337',
    username: '@alvaro',
    role: 'villager',
    death: 'f15c38b2-5adc-464c-94cc-521821284d5e'
  }, {
    id: 'bc6b193e-a0e7-428e-940b-ba3b23420c5b',
    username: '@cristiano.amici',
    role: 'hunter',
    death: null
  }, {
    id: '96f1ddcf-e56f-4055-9755-e6466f49f667',
    username: '@figueroa',
    role: 'witch',
    death: null
  }, {
    id: '6dad5a4c-59c3-447e-8778-6693805aa722',
    username: '@cjduncana',
    role: 'werewolf',
    death: 'd356747f-8a1e-41f9-991b-095198c8f425'
  }, {
    id: 'c4e97513-992c-437a-95be-61b37b1562d3',
    username: '@avargas',
    role: 'seer',
    death: null
  }],
  rounds: [{
    id: 'bc87e66c-48f2-423e-83e2-bda5818585bb',
    actions: [{
      id: '66551f63-194a-4a1f-906e-ea09abf1a95b',
      subjectId: 'c4e97513-992c-437a-95be-61b37b1562d3',
      verb: 'see',
      objectId: '207aca14-04c3-4e03-8091-9a4f8f65c337'
    }]
  }, {
    id: 'f15c38b2-5adc-464c-94cc-521821284d5e',
    actions: [{
      id: '60790525-2d63-4c98-b922-49efe8197d42',
      subjectId: 'bc6b193e-a0e7-428e-940b-ba3b23420c5b',
      verb: 'vote',
      objectId: '207aca14-04c3-4e03-8091-9a4f8f65c337'
    }, {
      id: '4001ae3a-a24b-4c93-b34c-f90cb31cb5e8',
      subjectId: '207aca14-04c3-4e03-8091-9a4f8f65c337',
      verb: 'vote',
      objectId: '96f1ddcf-e56f-4055-9755-e6466f49f667'
    }, {
      id: 'bc907887-8d5c-4323-b95f-fd8b6e307ce8',
      subjectId: '96f1ddcf-e56f-4055-9755-e6466f49f667',
      verb: 'vote',
      objectId: null
    }, {
      id: 'b4812e49-7c88-4f1d-ad43-380ca9bc365b',
      subjectId: 'c4e97513-992c-437a-95be-61b37b1562d3',
      verb: 'vote',
      objectId: '207aca14-04c3-4e03-8091-9a4f8f65c337'
    }, {
      id: '2042c6d4-48cb-4066-8b96-54f3a0bbd34d',
      subjectId: '6dad5a4c-59c3-447e-8778-6693805aa722',
      verb: 'vote',
      objectId: '207aca14-04c3-4e03-8091-9a4f8f65c337'
    }, {
      id: '51db0b0c-d1ec-40d1-a912-66cfed258571',
      subjectId: 'aed340be-03d4-4da8-add7-a88e2bc72b14',
      verb: 'vote',
      objectId: '207aca14-04c3-4e03-8091-9a4f8f65c337'
    }, {
      id: '9717037f-b357-4884-9a85-ecc3aff2a091',
      subjectId: '58067546-a787-4fbd-9bd2-92bf3f7839ed',
      verb: 'vote',
      objectId: '207aca14-04c3-4e03-8091-9a4f8f65c337'
    }]
  }, {
    id: 'd356747f-8a1e-41f9-991b-095198c8f425',
    actions: [{
      id: 'dbd17191-f20e-47d9-adab-21e2c1c0826e',
      subjectId: 'c4e97513-992c-437a-95be-61b37b1562d3',
      verb: 'see',
      objectId: '6dad5a4c-59c3-447e-8778-6693805aa722'
    }, {
      id: '8b0156c7-c791-4111-b131-21abdebc502b',
      subjectId: '96f1ddcf-e56f-4055-9755-e6466f49f667',
      verb: 'heal',
      objectId: 'aed340be-03d4-4da8-add7-a88e2bc72b14'
    }, {
      id: '2bace90c-f584-45a2-bacd-d5ed15220d7a',
      subjectId: '96f1ddcf-e56f-4055-9755-e6466f49f667',
      verb: 'poison',
      objectId: '6dad5a4c-59c3-447e-8778-6693805aa722'
    }, {
      id: '1da472bb-6b13-43cb-80e8-732de9e3abf5',
      subjectId: '6dad5a4c-59c3-447e-8778-6693805aa722',
      verb: 'kill',
      objectId: 'aed340be-03d4-4da8-add7-a88e2bc72b14'
    }, {
      id: '3a47255a-df28-4342-b957-968a58ab5f35',
      subjectId: '58067546-a787-4fbd-9bd2-92bf3f7839ed',
      verb: 'kill',
      objectId: 'aed340be-03d4-4da8-add7-a88e2bc72b14'
    }]
  }, {
    id: '39bd8fd2-83e1-42cf-a915-b81fe93bb828',
    actions: [{
      id: '521c7a7c-4643-43b6-8fb2-4a5b37136682',
      subjectId: 'bc6b193e-a0e7-428e-940b-ba3b23420c5b',
      verb: 'vote',
      objectId: '58067546-a787-4fbd-9bd2-92bf3f7839ed'
    }, {
      id: '3ef8acc3-4a0d-48c2-a0d8-c7c804cc789e',
      subjectId: '96f1ddcf-e56f-4055-9755-e6466f49f667',
      verb: 'vote',
      objectId: 'c4e97513-992c-437a-95be-61b37b1562d3'
    }, {
      id: '66382dfd-5776-417a-aa1a-0b7292a94449',
      subjectId: 'c4e97513-992c-437a-95be-61b37b1562d3',
      verb: 'vote',
      objectId: '58067546-a787-4fbd-9bd2-92bf3f7839ed'
    }, {
      id: 'e00b33a5-bb9e-4ad2-add2-336b27fdd272',
      subjectId: 'aed340be-03d4-4da8-add7-a88e2bc72b14',
      verb: 'vote',
      objectId: '58067546-a787-4fbd-9bd2-92bf3f7839ed'
    }, {
      id: '70922ec2-e71a-4bbd-a624-bf76a7618da4',
      subjectId: '58067546-a787-4fbd-9bd2-92bf3f7839ed',
      verb: 'vote',
      objectId: 'c4e97513-992c-437a-95be-61b37b1562d3'
    }]
  }]
}, {
  id: '1cdd4b3b-6c59-43b9-87e5-49b9be8d9e66',
  startTime: '2016-12-26T05:30:30-06:00',
  endTime: '2016-12-26T06:30:30-06:00',
  players: [{
    id: '6dad5a4c-59c3-447e-8778-6693805aa722',
    username: '@cjduncana',
    role: 'seer',
    death: null
  }, {
    id: 'bc6b193e-a0e7-428e-940b-ba3b23420c5b',
    username: '@cristiano.amici',
    role: 'werewolf',
    death: null
  }],
  rounds: [{
    id: '46506361-6bbb-4c38-bc00-850f9e98ad0c',
    actions: [{
      id: 'b8cdcce0-2bdb-4e4c-a057-aed55275bc5d',
      subjectId: '6dad5a4c-59c3-447e-8778-6693805aa722',
      verb: 'see',
      objectId: 'bc6b193e-a0e7-428e-940b-ba3b23420c5b'
    }]
  }, {
    id: 'f486cdd1-6a42-4450-be3e-00ebcf8c1450',
    actions: [{
      id: 'f3e61fef-48ab-46ff-b391-0618227317b3',
      subjectId: '6dad5a4c-59c3-447e-8778-6693805aa722',
      verb: 'vote',
      objectId: 'bc6b193e-a0e7-428e-940b-ba3b23420c5b'
    }, {
      id: 'db771e06-fc92-46bd-bc34-c65c78005c78',
      subjectId: 'bc6b193e-a0e7-428e-940b-ba3b23420c5b',
      verb: 'vote',
      objectId: '6dad5a4c-59c3-447e-8778-6693805aa722'
    }]
  }]
}];

function formatGame(game) {
  return Object.assign({}, game, {
    rounds: game.rounds.map((round) => {
      return formatRound(round, game.players);
    })
  });
}

function formatAction(action, players) {
  return Object.assign({}, action, {
    subject: players.find(({ id }) => {
      return id === action.subjectId;
    }),
    object: players.find(({ id }) => {
      return id === action.objectId;
    })
  });
}

function formatRound(round, players) {
  return Object.assign({}, round, {
    actions: round.actions.map((action) => {
      return formatAction(action, players);
    })
  });
}

module.exports = {
  getGame,
  getGames
};
