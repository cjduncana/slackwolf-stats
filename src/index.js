'use strict';

require('./index.html');
require('./favicon.ico');

const Elm = require('./Main.elm');
const mountNode = document.getElementById('main');

Elm.Main.embed(mountNode);
