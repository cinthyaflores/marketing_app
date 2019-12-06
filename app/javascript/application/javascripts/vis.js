import vis from 'vis-network';
import Rails from '@rails/ujs';

document.addEventListener('DOMContentLoaded', function() {
  if (document.getElementById('network-container')) {
    buildNetwork();
  }
});

function buildNetwork() {
  var nodes = buildNodes();
  var edges = buildEdges();

  var container = document.getElementById('network-container');
  var data = {
    nodes: nodes,
    edges: edges
  };
  var options = {};
  var network = new vis.Network(container, data, options);
  nodeStats(network);
}

function buildEdges() {
  const edges = document.getElementById('edges').value.split('|');
  edges.pop();

  var new_edges = edges.map(string => JSON.parse(string));
  return new vis.DataSet(new_edges);
}

function buildNodes() {
  const nodes = document.getElementById('nodes').value.split('|');
  nodes.pop();

  var new_nodes = nodes.map(string => JSON.parse(string));
  return new vis.DataSet(new_nodes);
}

function nodeStats(network) {
  document.getElementById('node-stats').onclick = function() {
    for(var key in network.body.nodes) {
      if (network.body.nodes[key].selected) {
        let nodeId = network.body.nodes[key].id
        let networkId = document.getElementById('network-id').value
        Rails.ajax({
          url: `${networkId}/nodes/${nodeId}`,
          type: 'GET',
          success: function(response) {
            loadCharts(response)
          }
        });
      }
    }
  }
};

function loadCharts(data){
  document.getElementById('node-stats-modal').classList.toggle('is-active');
  if (data.length == 0) {
    document.getElementById('chart-results').innerHTML = "No hay publicaciones hechas en esta campaña"
  } else {
    new Chartkick.ColumnChart("chart-results", data)
  }
  document.getElementById('accept-btn').onclick = function() {
    document.getElementById('node-stats-modal').classList.remove('is-active');
  }
}
