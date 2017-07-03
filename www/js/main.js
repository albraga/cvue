var Vue = require('vue');
var VueResource = require('vue-resource');
var RandomWord = require('./random-word.vue');

Vue.use(VueResource);

var vm = new Vue({
  el: '#vmid',
  components: {
    'random-word': RandomWord
  }
});