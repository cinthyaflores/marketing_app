import vis from 'vis-network';

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
