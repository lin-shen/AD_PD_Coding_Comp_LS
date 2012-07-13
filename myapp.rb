require 'sinatra'
require 'neography'

neo = NeographyRest.new(httplocalhost7474)

def create_graph(neo)
   # procedural API
  me = neo.get_root
  pr = neo.get_node_properties(me)
  return if pr && pr['name']
  neo.set_node_properties(me,{name = I})
  you = neo.create_node(name = you)
  neo.create_relationship(love, me, you)
end

create_graph(neo)

get '' do
  ## object-oriented-API
  me = NeographyNode.load(neo, 0)       
  rel = me.rels(love).first
  you = rel.end_node
  #{me.name} #{rel.rel_type} #{you.name}
end